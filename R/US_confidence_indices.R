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
#' @references \emph{Yale School of Management}, International Center for Finance: \href{https://som.yale.edu/faculty-research/our-centers-initiatives/international-center-finance/data/stock-market-confidence}{Stock Market Confidence Indices}
#' @references Stock Market Confidence Indices: \href{https://som.yale.edu/faculty-research/centers-initiatives/international-center-for-finance/data/stock-market-confidence-indices/stock-market-confidence-indices}{Terms of Use}
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
  Dir <- NULL
  Url <- NULL
  base_url <- paste0(
    "https://som.yale.edu/faculty-research/",
    "our-centers-initiatives/international-center-finance/",
    "data/stock-market-confidence-indices/"
  )
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
      "U.S. One Year Index",
      "U.S. Valuation Index",
      "U.S. Buy-On-Dips Confidence Index",
      "U.S. Crash Confidence Index"),
    stringsAsFactors = FALSE) %>%
    dplyr::mutate(Url = paste0(base_url, Dir)) %>%
    dplyr::select(-Dir)
}
