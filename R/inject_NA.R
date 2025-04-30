setClass(
  "NAInjectedDF",
  slots = c(
    data = "data.frame",
    injected_columns = "character",
    missing_percentage = "numeric",
    timestamp = "POSIXct"
  )
)
inject_NA <- function(df, columns, missing_percentage = 10) {
  stopifnot(is.data.frame(df))
  stopifnot(is.numeric(missing_percentage) && missing_percentage >= 0 && missing_percentage <= 100)

  injected <- character()

  for (col in columns) {
    if (col %in% names(df)) {
      n_missing <- ceiling(nrow(df) * (missing_percentage / 100))
      if (n_missing > 0) {
        miss_idx <- sample(seq_len(nrow(df)), n_missing)
        df[miss_idx, col] <- NA
        injected <- c(injected, col)
      }
    } else {
      warning(sprintf("Column '%s' does not exist in the data frame.", col))
    }
  }

  new("NAInjectedDF",
      data = df,
      injected_columns = unique(injected),
      missing_percentage = missing_percentage,
      timestamp = Sys.time())
}

