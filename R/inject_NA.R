inject_NA <- function(df, columns, missing_percentage = 10) {
  for (col in columns) {
    if (col %in% colnames(df)) {
      n_missing <- ceiling(nrow(df) * (missing_percentage / 100))
      miss_idx <- sample(1:nrow(df), n_missing, replace = FALSE)
      df[miss_idx, col] <- NA
    } else {
      warning(paste("Column", col, "does not exist in the data frame."))
    }
  }
  return(df)
}
