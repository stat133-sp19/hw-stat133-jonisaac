context("summary measures")

a <- 3:5
b <- 6
c <- .5

test_that("outputs are vectorized", {
  expect_length(aux_mean(a, c), 3)
  expect_length(aux_variance(a, c), 3)
  expect_length(aux_mode(a, c), 3)
  expect_length(aux_skewness(a, c), 3)
  expect_length(aux_kurtosis(a, c), 3)
})

test_that("outputs are numeric", {
  expect_type(aux_mean(a, c), "double")
  expect_type(aux_variance(a, c), "double")
  expect_type(aux_mode(a, c), "double")
  expect_type(aux_skewness(a, c), "double")
  expect_type(aux_kurtosis(a, c), "double")
})

test_that("values for functions are correct", {
  expect_equal(aux_mean(b, c), 3)
  expect_equal(aux_variance(b, c), 1.5)
  expect_equal(aux_mode(b, c), 3)
  expect_equal(aux_skewness(b, c), 0)
  expect_equal(3*aux_kurtosis(b, c), -1)
})
