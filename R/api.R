ua <- httr::user_agent("http://github.com/e3bo/epidatr")

epidata_api <- function(query) {
  base_url <- "https://delphi.cmu.edu/epidata/api.php"
  url <- httr::modify_url(base_url, query = query)
  resp <- httr::GET(url, ua)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <- httr::content(resp, as = "parsed", simplifyVector = TRUE)

  if (httr::http_error(resp) || parsed$result != 1) {
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
  }

  structure(list(
    content = parsed$epidata,
    query = query,
    response = resp
  ),
  class = "epidata_api")
}



print.epidata_api <- function(x, ...) {
  cat("<epidata ", x$query, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
