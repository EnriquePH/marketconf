#  ----------------------------------------------------------------------------
#  marketconf PACKAGE
#  Stock Market Confidence Indices in R
#  File: get_index.R
#  (c) 2018 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ----------------------------------------------------------------------------

#' Get html nodes from confidence indices at
#' Yale School of Management's web
#'
#' @inheritParams US_confidence_indices_url
#' @note The default value for \code{symbol} is "US1YI".
#' @note This function is only for internal use.
#' @importFrom magrittr "%>%"
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes
#' @return A \code{xml_nodeset} class data with indices information
#' @seealso \code{\link{get_index}}
#' @seealso \code{\link{find_table_index}}
#' @seealso \code{\link{check_index_symbol}}
#' @md
#' @examples
#' \dontrun{
#' get_nodes("US1YI")
#' }
get_nodes <- function(symbol = "US1YI") {
  symbol %>%
    check_index_symbol %>%
    US_confidence_indices_url %>%
    xml2::read_html() %>%
    rvest::html_nodes("table")
}


#' Extract indices data from html node
#'
#' @param nodes A \code{xml_nodeset} class data with indices information
#' @param investor A string with the type of investor:
#' \code{"Institutional"} or \code{"Individual"}
#' @importFrom magrittr "%>%" set_colnames extract2 extract
#' @importFrom utils tail
#' @importFrom rvest html_table
#' @importFrom dplyr mutate
#' @importFrom lubridate myd
#' @seealso \code{\link{get_index}}
#' @seealso \code{\link{get_nodes}}
#' @return A \code{data.frame} with ancillary data.
#' @note This function is only for internal use.
#' @examples
#' \dontrun{
#' find_table_index(get_nodes("US1YI"), investor = "Individual")
#' }
#'
find_table_index <- function(nodes, investor = "Institutional") {
  Date <- NULL
  Value <- NULL
  StdErr <- NULL
  type_investors <- c("Institutional", "Individual")
  if (!(investor %in% type_investors)) {
    stop(paste("Type of investor is not:", type_investors))
  }
  n_table <- ifelse(investor == "Institutional", 1L, 3L)
  nodes %>%
    magrittr::extract2(n_table) %>%
    rvest::html_table(header = FALSE, fill = TRUE) %>%
    magrittr::extract(1:3) %>%
    utils::tail(n = -3L) %>%
    magrittr::set_colnames(c("Date", "Value", "StdErr")) %>%
    dplyr::mutate(Date = lubridate::myd(Date, truncated = 1)) %>%
    dplyr::mutate(Value = as.numeric(Value)) %>%
    dplyr::mutate(StdErr = as.numeric(StdErr)) %>%
    dplyr::mutate(Investor = investor)
}

#' Get confidence index data from Yale School of Management's web
#'
#' Stock market confidence indexes are derived from survey data on
#' the behavior of U.S. investors.
#' @inheritParams US_confidence_indices_url
#' @note The default value for \code{symbol} is "US1YI".
#' @importFrom dplyr full_join mutate
#' @importFrom magrittr set_colnames "%>%"
#' @return A \code{data.table} with index value and standard deviation by date.
#' @seealso \code{\link{US_confidence_indices}}
#' @seealso \code{\link{US_confidence_indices_url}}
#' @seealso \code{\link{find_table_index}}
#' @seealso \code{\link{get_nodes}}
#'
#' @references \emph{Yale School of Management}, International Center for Finance: \href{https://som.yale.edu/faculty-research/our-centers-initiatives/international-center-finance/data/stock-market-confidence}{Stock Market Confidence Indices}
#' @references Stock Market Confidence Indices: \href{https://som.yale.edu/faculty-research/centers-initiatives/international-center-for-finance/data/stock-market-confidence-indices/stock-market-confidence-indices}{Terms of Use}
#' @export
#'
#' @examples
#' \dontrun{
#' get_index("USCI")
#' }
get_index <- function(symbol = "US1YI") {
  Investor <- NULL
  index_nodes <- symbol %>%
    check_index_symbol %>%
    get_nodes
  index_names <- c("Date", paste0(symbol, c(".Value", ".StdErr")), "Investor")
  dplyr::full_join(
    find_table_index(index_nodes, investor = "Institutional"),
    find_table_index(index_nodes, investor = "Individual"),
    by = c("Date", "Value", "StdErr", "Investor")) %>%
    magrittr::set_colnames(index_names) %>%
    dplyr::mutate(Investor = as.factor(Investor))
}
