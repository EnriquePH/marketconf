#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: US_confidence_indices_url.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ------------------------------------------------------------------------

#' Find Confidence Index symbol url
#'
#' @param symbol A string with the Confidence Index symbol
#' @importFrom magrittr "%>%" extract2
#' @importFrom dplyr filter select
#' @return A string with the \strong{Yale School of Management}'s web
#'  page symbol url
#' @seealso \code{\link{US_confidence_indices}}
#' @export
#'
#' @examples
#' \dontrun{
#' US_confidence_indices_url("USCI")
#' }
US_confidence_indices_url <- function(symbol = "US1YI") {
  Symbol <- NULL
  Url <- NULL
  df <- US_confidence_indices()
  if(!(symbol %in% df$Symbol)) {
    stop("Symbol not found")
  } else {
    df %>%
      dplyr::filter(Symbol == symbol) %>%
      dplyr::select(Url) %>%
      magrittr::extract2(1L)
  }
}
