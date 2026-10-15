index_symbols <- c("US1YI",
                   "USVI",
                   "USBODI",
                   "USCI")

for (index_symbol in index_symbols) {
  test_that(paste("get_index returns well-formed data with", index_symbol), {
    testthat::skip_on_cran()
    testthat::skip_if_offline("shiller-data-public.s3.amazonaws.com")
    index_df <- testthat::expect_silent(get_index(index_symbol))
    testthat::expect_s3_class(index_df, "data.frame")
    testthat::expect_named(index_df,
                           c("Date",
                             paste0(index_symbol, c(".Value", ".StdErr")),
                             "Investor"))
    testthat::expect_s3_class(index_df$Date, "Date")
    testthat::expect_type(index_df[[2]], "double")
    testthat::expect_type(index_df[[3]], "double")
    testthat::expect_setequal(levels(index_df$Investor),
                              c("Individual", "Institutional"))
    testthat::expect_false(anyNA(index_df$Date))
    testthat::expect_false(is.unsorted(index_df$Date))
    testthat::expect_false(anyDuplicated(index_df[c("Date", "Investor")]) > 0)
  })
}

test_that("get_index gives error with wrong code", {
  testthat::expect_error(get_index("XXX"), "not found")
})

test_that("get_index fails gracefully when the data is unavailable", {
  testthat::local_mocked_bindings(
    US_confidence_indices_url = function(symbol) "http://127.0.0.1:1/nope.csv"
  )
  testthat::expect_message(index_df <- get_index("USCI"), "Could not download")
  testthat::expect_null(index_df)
})
