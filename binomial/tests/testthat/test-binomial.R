context("binomial")

a <- 2
b <- 3
c <- 3:5
d <- .5

test_that("choose works right", {
  expect_equal(bin_choose(3, 2), 3)
})

test_that("probability works right", {
  expect_equal(bin_probability(2, 3, .5), 0.375)
})

test_that("lengths are correct", {
  expect_length(bin_choose(b, a), 1)
  expect_length(bin_probability(a, b, d), 1)
  expect_length(bin_distribution(a, d), 2)
  expect_length(bin_cumulative(a, d), 3)
})


test_that("functions spit out numbers or data frames", {
  expect_type(bin_choose(b, a), "double")
  expect_type(bin_probability(a, b, d), "double")
  expect_type(bin_distribution(a, d), "list")
  expect_type(bin_cumulative(a, d), "list")
})

test_that("errors get spit out with invalid inputs", {
  expect_error(bin_choose(a, b))
  expect_error(bin_probability(b, a, c))
  expect_error(bin_distribution(b, a))
  expect_error(bin_cumulative(b, a))
})


