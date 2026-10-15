#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: get_index.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ----------------------------------------------------------------------------

# nolint start: line_length_linter.
#' Get confidence index data from Yale School of Management's web
#'
#' Stock market confidence indexes are derived from survey data on
#' the behavior of U.S. investors.
#' @inheritParams US_confidence_indices_url
#' @note The default value for \code{symbol} is "US1YI".
#' @importFrom dplyr bind_rows mutate arrange
#' @importFrom magrittr set_colnames "%>%"
#' @importFrom lubridate my ceiling_date days
#' @return A \code{data.frame} with columns \code{Date} (last day of the
#'   survey month), \code{<symbol>.Value}, \code{<symbol>.StdErr} and
#'   \code{Investor} (factor: "Individual" or "Institutional"), sorted by date.
#'   If the data cannot be downloaded, a message is shown and \code{NULL} is
#'   returned invisibly.
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
#' \donttest{
#' index_df <- get_index("USCI")
#' if (!is.null(index_df)) head(index_df)
#' }
get_index <- function(symbol = "US1YI") {
  Investor <- NULL
  Date <- NULL
  symbol <- check_index_symbol(symbol)
  col_names <- c("Date", paste0(symbol, c(".Value", ".StdErr")))
  index_url <- US_confidence_indices_url(symbol)
  index_data <- tryCatch(
    utils::read.csv(index_url, skip = 1, na.strings = "-",
                    colClasses = c("character", rep("numeric", 4))),
    error = function(e) conditionMessage(e),
    warning = function(w) conditionMessage(w)
  )
  if (!is.data.frame(index_data) || ncol(index_data) != 5L) {
    reason <- if (is.character(index_data)) index_data else "unexpected format"
    message("Could not download confidence index data from ", index_url,
            " (", reason, ").")
    return(invisible(NULL))
  }

  # Institutional data
  index_institutional <- index_data[1:3] %>%
    magrittr::set_colnames(col_names) %>%
    dplyr::mutate(Investor = "Institutional")
  # Individual data
  index_individual <- index_data[c(1, 4, 5)] %>%
    magrittr::set_colnames(col_names) %>%
    dplyr::mutate(Investor = "Individual")
  # Stack both data frames
  one_day <- lubridate::days(1)
  dplyr::bind_rows(index_institutional, index_individual) %>%
    dplyr::mutate(Investor = factor(Investor)) %>%
    dplyr::mutate(Date = lubridate::my(Date)) %>%
    dplyr::mutate(Date = lubridate::ceiling_date(Date,
                                                 "month") - one_day) %>%
    dplyr::arrange(Date)
}
# nolint end
