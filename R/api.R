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
#'   the form YYYMMDD. Use two time values separated by "-" to obtain data from
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
#'     \item{epidata}{a data frame with rows containing elements of the epidata list
#'       returned from the API}
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
                        "quidel"
                      ),
                      signal = c(
                        "smoothed_cli",
                        "raw_cli",
                        "raw_ili",
                        "raw_wcli",
                        "raw_wili",
                        "smoothed_ili",
                        "smoothed_wcli",
                        "smoothed_wili",
                        "raw_search",
                        "smoothed_search",
                        "smoothed_pct_negative",
                        "smoothed_tests_per_device"
                      ),
                      time_type = "day",
                      time_values = "20200415",
                      geo_type = c("state", "county", "msa", "hrr"),
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

print.epidata_api <- function(x, ...) {
  cat("<epidata ", x$url, ">\n", sep = "")
  utils::str(x$epidata)
  invisible(x)
}
