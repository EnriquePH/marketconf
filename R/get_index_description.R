#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: get_index_description.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ------------------------------------------------------------------------

#' Get Confidence Index description
#'
#' @inheritParams US_confidence_indices_url
#' @md
#' @note The default value for \code{symbol} is "US1YI".
#' @importFrom magrittr "%>%" extract2
#' @importFrom dplyr filter select
#' @return A string with the Confidence Index description
#' @seealso \code{\link{US_confidence_indices}}
#' @seealso \code{\link{get_index}}
#' @seealso \code{\link{check_index_symbol}}
#'
#' @examples
#' get_index_description("USCI")
#' @export
get_index_description <- function(symbol = "US1YI") {
  Symbol <- NULL
  Description <- NULL
  US_confidence_indices() %>%
    dplyr::filter(Symbol == check_index_symbol(symbol)) %>%
    dplyr::select(Description) %>%
    magrittr::extract2(1L)
}
