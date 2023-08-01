#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: US_confidence_indices_url.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ------------------------------------------------------------------------

#' Get Confidence Index symbol url
#'
#' @param symbol A string with a Confidence Index symbol:
#' * \emph{US1YI}: U.S. One-Year Confidence Index
#' * \emph{USVI}: U.S. Valuation Confidence Index
#' * \emph{USBODI}: U.S. Buy-On-Dips Confidence Index
#' * \emph{USCI}: U.S. Crash Confidence Index
#' @md
#' @note The default value for \code{symbol} is "US1YI".
#' @importFrom magrittr "%>%" extract2
#' @importFrom dplyr filter select
#' @return A string with the \strong{Yale School of Management}'s web
#'  page symbol url
#' @seealso \code{\link{US_confidence_indices}}
#' @seealso \code{\link{get_index_description}}
#' @seealso \code{\link{get_index_info}}
#' @seealso \code{\link{get_index}}
#' @export
#'
#' @examples
#' \dontrun{
#' US_confidence_indices_url("USCI")
#' }
US_confidence_indices_url <- function(symbol = "US1YI") {
  Symbol <- NULL
  Url <- NULL
  US_confidence_indices() %>%
    dplyr::filter(Symbol == check_index_symbol(symbol)) %>%
    dplyr::select(Url) %>%
    magrittr::extract2(1L)
}
