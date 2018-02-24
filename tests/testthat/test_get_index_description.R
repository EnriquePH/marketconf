index_symbols <- c("US1YI",
                   "USVI",
                   "USBODI",
                   "USCI")


index_description <- c(
  "U.S. One Year Index",
  "U.S. Valuation Index",
  "U.S. Buy-On-Dips Confidence Index",
  "U.S. Crash Confidence Index"
)

test_that("Index description list is Ok", {
  testthat::expect_equal(unlist(lapply(index_symbols, get_index_description)),
                         index_description)
})

test_that("get_index_description gives error with wrong code", {
  testthat::expect_error(get_index_description("XXX"))
})
