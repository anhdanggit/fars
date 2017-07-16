library(testthat)
test_that("Creating a valid file name", {
  expect_that(make_filename(2013), matches("accident_2013.csv.bz2"))
})
