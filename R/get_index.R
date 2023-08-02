#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: get_index.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ----------------------------------------------------------------------------

#' Get confidence index data from Yale School of Management's web
#'
#' Stock market confidence indexes are derived from survey data on
#' the behavior of U.S. investors.
#' @inheritParams US_confidence_indices_url
#' @note The default value for \code{symbol} is "US1YI".
#' @importFrom dplyr full_join mutate join_by
#' @importFrom magrittr set_colnames "%>%"
#' @importFrom lubridate myd ceiling_date days
#' @return A \code{data.table} with index value, standard deviation, and type of investor, by date.
#' @seealso \code{\link{US_confidence_indices}}
#' @seealso \code{\link{US_confidence_indices_url}}
#' @seealso \code{\link{get_index_description}}
#' @seealso \code{\link{get_index_info}}
#' @seealso \code{\link{check_index_symbol}}
#'
#' @references \emph{Yale School of Management}, International Center for Finance: \href{https://som.yale.edu/faculty-research/our-centers-initiatives/international-center-finance/data/stock-market-confidence}{Stock Market Confidence Indices}
#' @references Stock Market Confidence Indices: \href{https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices/united-states}{Terms of Use}
#' @export
#'
#' @examples
#' \dontrun{
#' get_index("USCI")
#' }
get_index <- function(symbol = "US1YI") {
  Investor <- NULL
  Date <- NULL
  col_names <- c("Date", paste0(symbol, c(".Value", ".StdErr")))
  index_data <- symbol %>%
    check_index_symbol %>%
    US_confidence_indices_url %>%
    utils::read.csv(skip = 1, na.strings = "-")

  # Institutional data
  index_institutional <- index_data[1:3] %>%
    magrittr::set_colnames(col_names) %>%
    dplyr::mutate(Investor = "Institutional")
  # Individual data
  index_individual <- index_data[c(1, 4, 5)] %>%
    magrittr::set_colnames(col_names) %>%
    dplyr::mutate(Investor = "Individual")
  # Join both data frames
  one_day <- lubridate::days(1)
  suppressMessages(dplyr::full_join(index_institutional,
                                    index_individual)) %>%
    dplyr::mutate(Investor = factor(Investor)) %>%
    dplyr::mutate(Date = lubridate::myd(Date, truncated = 1)) %>%
    dplyr::mutate(Date = lubridate::ceiling_date(Date,
                                                 "month") - one_day) %>%
    dplyr::arrange(Date)
}
