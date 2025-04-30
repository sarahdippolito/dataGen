test_that("random_df correct number of columns", {
  result_df <- random_df(15,5)
  expect_equal(ncol(result_df), 5)
})
