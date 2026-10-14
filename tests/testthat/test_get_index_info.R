test_that("get_index_info returns one string per symbol", {
  for (index_symbol in US_confidence_indices()$Symbol) {
    info <- get_index_info(index_symbol)
    testthat::expect_type(info, "character")
    testthat::expect_length(info, 1L)
    testthat::expect_false(grepl("  ", info))
  }
})

test_that("get_index_info gives error with wrong code", {
  testthat::expect_error(get_index_info("XXX"))
})
