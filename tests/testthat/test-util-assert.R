test_that("assert_scalar", {
  expect_error(assert_scalar(NULL), "must be a scalar")
  expect_error(assert_scalar(numeric(0)), "must be a scalar")
  expect_error(assert_scalar(1:2), "must be a scalar")
})


test_that("assert_character", {
  expect_silent(assert_character("a"))
  expect_silent(assert_character(c("a", "b")))
  expect_error(assert_character(1), "must be character")
  expect_error(assert_character(TRUE), "must be character")
})


test_that("assert_scalar_character", {
  expect_silent(assert_scalar_character("a"))
  expect_error(assert_scalar_character(c("a", "b")), "must be a scalar")
  expect_error(assert_scalar_character(1), "must be character")
  expect_error(assert_scalar_character(TRUE), "must be character")
})
