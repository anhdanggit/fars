library(testthat)
test_that("Valid created file name", {
  expect_that(make_filename(abc), throws_error())
})
