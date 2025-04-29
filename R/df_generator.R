df_generator <- function(rows,
                         date_col = NULL,
                         date_range = c(as.Date('2020-01-01'), as.Date('2025-01-01')),
                         int_col = NULL, int_range = c(1, 100),
                         float_col = NULL, float_min = 1, float_max = 100,
                         boolean_col = NULL,
                         letters_col = NULL,
                         distribution_col = NULL,
                         dist_type = "normal",
                         dist_params = list(mean = 50, sd = 10),
                         user_col = NULL,
                         user_data = NULL,
                         missing = NULL, n_missing = 0,
                         id_col = NULL,
                         unique_id = NULL, id_digits=4, id_prefix="")
                         {

  df <- data.frame(row_id = 1:rows)[,0]
  add_column <- function(df, col_name, col_data) {
    if (col_name %in% colnames(df)) {
      col_name <- paste0(col_name, "_", sum(grepl(col_name, colnames(df))))
    }
    df[[col_name]] <- col_data
    return(df)
  }

  if (!is.null(date_col)) {
    dates <- sample(seq(date_range[1], date_range[2], by = "day"), rows, replace = TRUE)
    df <- add_column(df, date_col, dates)
  }

  if (!is.null(int_col)) {
    ints <- sample(int_range[1]:int_range[2], rows, replace = TRUE)
    df <- add_column(df, int_col, ints)
  }

  if (!is.null(float_col)) {
    floats <- runif(rows, min = float_min, max = float_max)
    df <- add_column(df, float_col, floats)
  }

  if (!is.null(boolean_col)) {
    bools <- sample(c(TRUE, FALSE), rows, replace = TRUE)
    df <- add_column(df, boolean_col, bools)
  }

  if (!is.null(letters_col)) {
    chars <- sample(letters, rows, replace = TRUE)
    df <- add_column(df, letters_col, chars)
  }
  if (!is.null(user_col)) {
    values <- sample(user_data, rows, replace = TRUE)
    df <- add_column(df, user_col, values)
  }

  if (!is.null(distribution_col)) {
    if (dist_type == "normal") {
      vals <- rnorm(rows, mean = dist_params$mean, sd = dist_params$sd)
    } else if (dist_type == "uniform") {
      vals <- runif(rows, min = dist_params$min, max = dist_params$max)
    }
    else if (dist_type=="binomial"){
      vals <- rbinom(rows, size = dist_params$size, prob=dist_params$prob)
    }
    else {
      stop("Unsupported distribution type.")
    }
    df <- add_column(df, distribution_col, vals)
  }

  # Inject missing values
  if (!is.null(missing) && n_missing > 0) {
    if (!(missing %in% colnames(df))) {
      stop("Specified column for missing values doesn't exist.")
    }
    miss_idx <- sample(1:rows, size = min(n_missing, rows), replace = FALSE)
    df[miss_idx, missing] <- NA
  }

  if(!is.null(id_col)){
    ids <- seq(from = 1, by=1, length.out=rows)
    df <- add_column(df, id_col, ids)
  }
  if(!is.null(unique_id)){
    max_ids <- 10^id_digits - 10^(id_digits-1)
    if (rows > max_ids) stop("Not enough unique ids with given rows")
    numeric_ids <- sample(10^(id_digits - 1):(10^id_digits-1), rows, replace=FALSE)
    ids <- paste0(id_prefix, numeric_ids)
    df <- add_column(df, unique_id, ids)
  }
  return(df)
}

set.seed(43)
df1 <- df_generator(
  rows = 20,
  id_col="ids",
  date_col = "dt",
  int_col = "score", int_range = c(10, 50),
  float_col = "rating",
  boolean_col = "passed",
  letters_col = "grade_letter",
  distribution_col = "normal_score",
  dist_type = "normal",
  dist_params = list(mean = 75, sd = 5),
  user_col = "grades",
  user_data = c("A","B","C","D","F"),
  missing = "score",
  n_missing = 3,
  unique_id = "U-id",
  id_prefix = "U",
  id_digits = 7
)
print(df1)



