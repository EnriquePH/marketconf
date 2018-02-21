
test_that("get_index gives no error with US1YI",
          {
            testthat::expect_silent(get_index("US1YI"))
          })

test_that("get_index gives no error with USVI",
          {
            testthat::expect_silent(get_index("USVI"))
          })

test_that("get_index gives no error with USBODI",
          {
            testthat::expect_silent(get_index("USBODI"))
          })

test_that("get_index gives no error with USCI",
          {
            testthat::expect_silent(get_index("USCI"))
          })

test_that("get_index gives error with wrong code",
          {
            testthat::expect_error(get_index("XXX"))
          })
