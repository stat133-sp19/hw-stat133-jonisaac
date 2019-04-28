context("checkers")

a <- .5
b <- 3
c <- 5

test_that("checkers allow correct values", {
  expect_true(check_prob(a))
  expect_true(check_success(b, c))
  expect_true(check_trials(c))
})

test_that("length of checkers is 1", {
  expect_equal(length(check_prob(a)), 1)
  expect_equal(length(check_success(b, c)), 1)
  expect_equal(length(check_trials(c)), 1)
})

test_that("error if input is invalid", {
  expect_error(check_prob(b))
  expect_error(check_success(c, b))
  expect_error(check_trials(a))
})
