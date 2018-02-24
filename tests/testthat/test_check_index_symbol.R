index_symbols <- c("US1YI",
                   "USVI",
                   "USBODI",
                   "USCI")

test_that("Index symbols list is Ok", {
  testthat::expect_equal(unlist(lapply(index_symbols, check_index_symbol)),
                         index_symbols)
})

test_that("check_index_symbol gives error with wrong code", {
  testthat::expect_error(check_index_symbol("XXX"))
})
