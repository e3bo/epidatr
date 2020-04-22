epidata_api <- function(query){
  base_url <- "https://delphi.cmu.edu/epidata/api.php"
  url <- httr::modify_url(base_url, query = query)
  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <- httr::content(resp, as = "parsed")
  structure(
    list(
      content = parsed,
      query = query,
      response = resp
    ),
    class = "epidata_api"
  )
}

print.epidata_api <- function(x, ...) {
  cat("<epidata ", x$query, ">\n", sep = "")
  str(x$content)
  invisible(x)
}
