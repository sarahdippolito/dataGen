test_that("df_generator returns the correct number of rows", {
  result <- df_generator(
    rows = 10,
    int_col = "integers",
    int_range = c(1, 100),
    float_col = "floats",
    float_min = 0,
    float_max = 100,
    letters_col = "letters"
  )

  expect_equal(nrow(result$df), 10)
})

