#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: check_index_symbol.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ----------------------------------------------------------------------------


#' Check Confidence Index Symbol
#'
#' This function validates the symbol input.
#' @inheritParams US_confidence_indices_url
#' @md
#' @return A string with the \code{symbol} or an error if it
#' is not found.
#'
#' @seealso \code{\link{US_confidence_indices}}
#' @seealso \code{\link{US_confidence_indices_url}}
#'
#' @examples
#' check_index_symbol("USVI")
#' @export
check_index_symbol <- function(symbol) {
  symbol_list <- US_confidence_indices()$Symbol
  if (!(symbol %in% symbol_list)) {
    stop(paste("Confidence Index Symbol not found"))
  }
  symbol
}
