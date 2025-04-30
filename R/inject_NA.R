inject_NA <- function(df, columns, missing_percentage = 10) {
  stopifnot(is.data.frame(df))
  stopifnot(is.numeric(missing_percentage) && missing_percentage >= 0 && missing_percentage <= 100)

  for (col in columns) {
    if (col %in% names(df)) {
      n_missing <- ceiling(nrow(df) * (missing_percentage / 100))
      miss_idx <- sample(seq_len(nrow(df)), n_missing)
      df[miss_idx, col] <- NA
    } else {
      warning(sprintf("Column '%s' does not exist in the data frame.", col))
    }
  }

  return(df)
}

df <- iris
df_new <- inject_NA(iris, c("Sepal.Length", "Sepal.Width", "Petal.Width"), 10 )
df_new
