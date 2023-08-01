#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: US_confidence_indices.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ----------------------------------------------------------------------------

#' US confidence indices data.frame
#'
#' @return A \code{data.frame} with symbols and urls from
#' \strong{Yale School of Management}'s web page.
#'
#' @seealso \code{\link{US_confidence_indices_url}}
#' @seealso \code{\link{get_index}}
#' @seealso \code{\link{get_index_description}}
#' @seealso \code{\link{get_index_info}}
#' @references \emph{Yale School of Management}, International Center for Finance: \href{https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices}{Stock Market Confidence Indices}
#' @references Stock Market Confidence Indices: \href{https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices/united-states}{Terms of Use}
#'
#' @importFrom magrittr "%>%"
#' @importFrom dplyr mutate select
#' @export
#'
#' @examples
#' \dontrun{
#' US_confidence_indices()
#' }
US_confidence_indices <- function() {
  data.frame(
    Symbol = c("US1YI",
               "USVI",
               "USBODI",
               "USCI"),
    Dir = c(
      "united-states-one-year-index",
      "united-states-valuation-index",
      "united-states-buy-dips-confidence-index",
      "us-crash-confidence-index"
    ),
    Description = c(
      "U.S. One Year Confidence Index",
      "U.S. Valuation Confidence Index",
      "U.S. Buy-On-Dips Confidence Index",
      "U.S. Crash Confidence Index"
      ),
    Info = c(
      paste("The percent of the population",
            "expecting an increase in the Dow in the coming year."),
      paste("The percent of the population",
            "who think that the market is not too high."),
      paste("The percent of the population",
            "expecting a rebound the next day should the market",
            "ever drop 3% in one day."),
      paste("The percent of the population", "who attach little probability",
            " to a stock market crash in the next-six months.")
      ),
    Url = c("https://shiller-data-public.s3.amazonaws.com/icf_stock_market_confidence_index_table.csv",
            "https://shiller-data-public.s3.amazonaws.com/icf_stock_market_valuation_index_table.csv",
            "https://shiller-data-public.s3.amazonaws.com/icf_stock_market_dips_index_table.csv",
            "https://shiller-data-public.s3.amazonaws.com/icf_stock_market_crash_index_table.csv"),
    stringsAsFactors = FALSE)
}
