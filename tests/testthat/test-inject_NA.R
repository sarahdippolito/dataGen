test_that("inject_NA fills data frames with the correct amount of NAs", {
df <- data.frame(x=1:10, i=11:20)
result <- inject_NA(df, columns="x", missing_percentage=50)
expect_equal(sum(is.na(result$x)), 5)
expect_equal(sum(is.na(result$i)), 0)
})

