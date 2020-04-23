ua <- httr::user_agent("http://github.com/e3bo/epidatr")


covidcast <- function(source = c("covidcast", "covidcast_meta"),
                      data_source = c("doctor-visits", "fb-survey", "ght", "google-survey", "quidel"),
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
                      time_values = "20200410",
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
    stop(
      sprintf(
        "epidata API unable to return results. Run `covidcast(source=\"covidcast_meta\")` to see available data.\nresult : %d\n%s\n<%s>",
        parsed$result,
        parsed$message,
        "https://github.com/cmu-delphi/delphi-epidata/blob/master/docs/api/covidcast.md"
      ),
      call. = FALSE
    )
  }
  if (is.element("last_update", names(parsed$epidata))) {
    parsed$epidata$last_update <- as.POSIXct(parsed$epidata$last_update,
                                             origin = "1970-01-01 00:00.00 UTC")
  }
  structure(list(
    content = parsed$epidata,
    url = url,
    response = resp
  ),
  class = "epidata_api")
}

print.epidata_api <- function(x, ...) {
  cat("<epidata ", x$url, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
