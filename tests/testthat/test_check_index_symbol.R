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

test_that("check_index_symbol rejects invalid input types", {
  testthat::expect_error(check_index_symbol(NA_character_), "single")
  testthat::expect_error(check_index_symbol(c("USVI", "USCI")), "single")
  testthat::expect_error(check_index_symbol(1), "single")
})

test_that("US_confidence_indices_url returns a csv url", {
  testthat::expect_match(US_confidence_indices_url("USCI"), "\\.csv$")
})
