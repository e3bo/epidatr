ua <- httr::user_agent("http://github.com/e3bo/epidatr")

#' Access Delphi's COVID-19 Surveillance Streams Data
#'
#' \code{covidcast} provides an interface to the API documented at
#' \url{https://cmu-delphi.github.io/delphi-epidata/api/covidcast.html}.
#' There is a simple R script available in the delphi-epidata git repository
#'  which also can be used to access the API in R.
#'
#' @param source String specifying whether to request data or metadata.
#' @param data_source String specifying data stream.
#' @param signal String specifying specific time series from data stream.
#' @param time_type String specifying time unit.
#' @param time_values String specifying time value of data. Dates must be in
#'   the form YYYYMMDD. Use two time values separated by "-" to obtain data from
#'   a range of time values. Request data from multiple time values by
#'   concatenating them using "," as a separator.
#' @param geo_type String specifying type of geographic unit.
#' @param geo_value String specifying geographic value of data.
#'   \code{*} for all available. See API documentation for valid identifiers.
#' @param query String with query for API that overides other arguments if
#'   provided.
#'
#' @return An S3 object which is simply a list which has its own print method.
#'   The list's elements are:
#'   \describe{
#'     \item{epidata}{a data frame with rows containing elements of the
#'       epidata list returned from the API}
#'     \item{url}{the URL used in the API request}
#'     \item{response}{the full response.}
#'   }
#' @export
#'
#' @examples
#' covidcast(source="covidcast_meta")
#' covidcast(data_source = "fb-survey", signal = "raw_cli",
#'   geo_type = "county", time_value = "20200401,20200405-20200414",
#'   geo_value = "06001")
covidcast <- function(source = c("covidcast", "covidcast_meta"),
                      data_source = c(
                        "doctor-visits",
                        "fb-survey",
                        "ght",
                        "google-survey",
                        "indicator-combination",
                        "jhu-csse",
                        "quidel",
                        "youtube-survey"
                      ),
                      signal = c(
                        "smoothed_adj_cli",
                        "smoothed_cli",
                        "raw_cli",
                        "raw_hh_cmnty_cli",
                        "raw_ili",
                        "raw_nohh_cmnty_cli",
                        "raw_wcli",
                        "raw_wili",
                        "smoothed_hh_cmnty_cli",
                        "smoothed_ili",
                        "smoothed_nohh_cmnty_cli",
                        "smoothed_wcli",
                        "smoothed_wili",
                        "raw_search",
                        "smoothed_search",
                        "nmf_day_doc_fbs_ght",
                        "confirmed_cumulative_num",
                        "confirmed_incidence_num",
                        "confirmed_incidence_prop",
                        "deaths_cumulative_num",
                        "deaths_incidence_num",
                        "deaths_incidence_prop",
                        "raw_pct_negative",
                        "raw_tests_per_device",
                        "smoothed_pct_negative",
                        "smoothed_tests_per_device"
                      ),
                      time_type = "day",
                      time_values = "20200415",
                      geo_type = c("state", "county", "msa", "hrr", "dma"),
                      geo_value = c("NY"),
                      query = NULL) {

  if (is.null(query)) {
    query <-
      list(
        source = match.arg(source),
        data_source = match.arg(data_source),
        signal = match.arg(signal),
        time_type = match.arg(time_type),
        time_values = time_values,
        geo_type = match.arg(geo_type),
        geo_value = geo_value
      )
  }

  base_url <- "https://delphi.cmu.edu/epidata/api.php"
  url <- httr::modify_url(base_url, query = query)
  resp <- httr::GET(url, ua)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <-
    httr::content(resp, as = "parsed", simplifyVector = TRUE)

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "epidata API request failed [%s]\nresult : %d\n%s\n<%s>",
        httr::status_code(resp),
        parsed$result,
        parsed$message,
        "https://github.com/cmu-delphi/delphi-epidata/tree/master/docs/api"
      ),
      call. = FALSE
    )
  } else if (parsed$result != 1) {
    stop(sprintf(
      paste0(
        "epidata API unable to return results. Run ",
        "`covidcast(source=\"covidcast_meta\")` to ",
        "see available data.\nresult : %d\n%s\n<%s>"
      ),
      parsed$result,
      parsed$message,
      paste0(
        "https://github.com/cmu-delphi/delphi-epidata/",
        "blob/master/docs/api/covidcast.md"
      )
    ),
    call. = FALSE)
  }
  if (is.element("last_update", names(parsed$epidata))) {
    parsed$epidata$last_update <-
      as.POSIXct(parsed$epidata$last_update,
                 origin = "1970-01-01 00:00.00 UTC")
  }
  structure(list(
    epidata = parsed$epidata,
    url = url,
    response = resp
  ),
  class = "epidata_api")
}

fluview_regions <- list(
  national = c("nat", paste0("hhs", 1:10)),
  state = c(setdiff(tolower(state.abb), c("fl", "ny")), "jfk", "dc", "pr",
            "vi", "ny_minus_jfk"),
  census = paste0("cen", 1:9)
)

#' Access Delphi's collection of CDC FluView Data
#'
#' \code{fluview} provides an interface to the API documented at
#' \url{https://cmu-delphi.github.io/delphi-epidata/api/fluview.html}.
#' There is a simple R script available in the delphi-epidata git repository
#'  which also can be used to access the API in R.
#'
#' @param epiweeks String specifying epiweeks for which to request data.
#'   Epiweeks must be in the form YYYYUU. Use two epiweeks separated by "-" to
#'   obtain data from a range of time values. Request data from multiple time
#'   values by concatenating them using "," as a separator.
#' @param regions String specifying regions for which to request data. Regions
#'   identifiers must be those used by the API or \code{flusight_state} or
#'   \code{flusight} which gives sets of regions that are included in those
#'   competitions.
#' @param lag String specifying the number of weeks after the requested epiweek
#'   to use as the issue week.  The issue week is the week at which the data are
#'   considered up-to-date. In other words, all revisions of the data up to that
#'   week are applied.
#' @param issues String specifying the issues of the data to request. The formating
#'   is the same is \code{epiweeks}. This parameter
#'   is an alternative to lag, and overides it if present. \code{issue} = \code{lag} +
#'   \code{epiweek}.
#' @param query String with query for API that overides other arguments if
#'   provided.
#'
#' @return An S3 object which is simply a list which has its own print method.
#'   The list's elements are:
#'   \describe{
#'     \item{epidata}{a data frame with rows containing elements of the
#'       epidata list returned from the API}
#'     \item{url}{the URL used in the API request}
#'     \item{response}{the full response.}
#'   }
#' @export
#'
#' @examples
#' fluview(regions = "nat")
#' fluview(regions = "jfk", epiweeks = "202015", lag=1)
#' fluview(regions = "jfk", epiweeks = "202015", issues = "202016")
fluview <- function(epiweeks = "202016",
                    regions = "flusight_state",
                    lag = 0,
                    issues = NULL,
                    query = NULL) {
  if (is.null(query)) {
    if(regions == "flusight_state"){
      regions <- paste0(fluview_regions$state, collapse = ',')
    } else if (regions == "flusight"){
      regions <- paste0(fluview_regions$national, collapse = ',')
    } else if (regions == "census"){
      regions <- paste0(fluview_regions$census, collapse = ",")
    }
    query <-
      list(
        source = "fluview",
        epiweeks = epiweeks,
        regions = regions,
        lag = lag,
        issues = issues
      )
  }

  base_url <- "https://delphi.cmu.edu/epidata/api.php"
  url <- httr::modify_url(base_url, query = query)
  resp <- httr::GET(url, ua)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <-
    httr::content(resp, as = "parsed", simplifyVector = TRUE)

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "epidata API request failed [%s]\nresult : %d\n%s\n<%s>",
        httr::status_code(resp),
        parsed$result,
        parsed$message,
        "https://github.com/cmu-delphi/delphi-epidata/tree/master/docs/api"
      ),
      call. = FALSE
    )
  } else if (parsed$result != 1) {
    stop(sprintf(
      "epidata API unable to return results.\n result : %d\n%s\n<%s>",
      parsed$result,
      parsed$message,
      paste0(
        "https://github.com/cmu-delphi/delphi-epidata/",
        "blob/master/docs/api/fluview.md"
      )
    ),
    call. = FALSE)
  }
  structure(list(
    epidata = parsed$epidata,
    url = url,
    response = resp
  ),
  class = "epidata_api")
}


hhs_states <- c(toupper(state.abb), "DC", "PR", "VI")

#' Access Delphi's collection of healthdata.gov data
#'
#' \code{healthdata} provides an interface to the API documented at
#' \url{https://cmu-delphi.github.io/delphi-epidata/api/covid_hosp.html}
#' 
#' There is a simple R script available in the delphi-epidata git repository
#'  which also can be used to access the API in R.
#'
#' @param states String specifying two-letter abbreviations of states or DC, PR, and VI. 
#' The string "hhs_states" requests the complete set. Multiple state abbreviations
#' can be separated with commas.
#' @param issues String specifying a list of "issue" dates or date ranges.
#' @param query String with query for API that overides other arguments if
#'   provided.
#'
#' @return An S3 object which is simply a list which has its own print method.
#'   The list's elements are:
#'   \describe{
#'     \item{epidata}{a data frame with rows containing elements of the
#'       epidata list returned from the API}
#'     \item{url}{the URL used in the API request}
#'     \item{response}{the full response.}
#'   }
#' @export
#'
#' @examples
#' healthdata(states = "hhs_states")
#' healthdata(states="MA",dates="20200101-20201116",issue="20201116")

healthdata <- function(dates = "20200510",
                    states = "hhs_states",
                    issues = NULL,
                    query = NULL) {
  if (is.null(query)) {
    if(states == "hhs_states"){
      states <- paste0(hhs_states, collapse = ',')
    }
    query <-
      list(
        endpoint = "covid_hosp",
        states = states,
        dates = dates,
        issues = issues
      )
  }
  
  base_url <- "https://delphi.cmu.edu/epidata/api.php"
  url <- httr::modify_url(base_url, query = query)
  resp <- httr::GET(url, ua)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <-
    httr::content(resp, as = "parsed", simplifyVector = TRUE)
  
  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "epidata API request failed [%s]\nresult : %d\n%s\n<%s>",
        httr::status_code(resp),
        parsed$result,
        parsed$message,
        "https://cmu-delphi.github.io/delphi-epidata/api/README.html"
      ),
      call. = FALSE
    )
  } else if (parsed$result != 1) {
    stop(sprintf(
      "epidata API unable to return results.\n result : %d\n%s\n<%s>",
      parsed$result,
      parsed$message,
      "https://cmu-delphi.github.io/delphi-epidata/api/README.html"
    ),
    call. = FALSE)
  }
  structure(list(
    epidata = parsed$epidata,
    url = url,
    response = resp
  ),
  class = "epidata_api")
}

print.epidata_api <- function(x, ...) {
  cat("<epidata ", x$url, ">\n", sep = "")
  utils::str(x$epidata)
  invisible(x)
}
