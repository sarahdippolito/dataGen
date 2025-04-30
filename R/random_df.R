#' random_df.R
#' @param rows The number of rows in the data frame
#' @param cols The number of columns in the data frame
#' @return randomly generated data frame
#' @export

random_df <- function(rows, cols){
  df <- data.frame(row_id = 1:rows)[,0]
  h=1
  c=1
  q=1
  p=1
  d=1
  for(i in 1:cols) {
      col <- sample(1:5, 1)
      if (col==1){
        col_name = paste0("binomial",c)
        size <- sample(1:100,1)
        prob <- runif(1)
        vals <- rbinom(rows, size=size, prob=prob)
        df[[col_name]] <- vals
        c=c+1
      }
      if (col==2){
        col_name = paste0("normal",h)
        mean = sample(1:10000,1)
        sd = sample(1:100,1)
        vals <- rnorm(rows, mean = mean, sd = sd)
        df[[col_name]] <- vals
        h=h+1
      }
      if (col==3){
        col_name = paste0("uniform",q)
        a = sample(1:100,1)
        b = a+sample(1:100,1)
          vals = runif(rows, min=a, max=b)
        df[[col_name]] <- vals
        q=q+1
      }
      if(col==4){
        col_name = paste0("poisson",p)
        lambda = sample(1:100, 1)
        vals <- rpois(rows, lambda=lambda)
        df[[col_name]] <- vals
        p=p+1
      }
      if(col==5){
        col_name = paste0("exponential",d)
        lambda = sample(1:100, 1)
        vals <- rexp(rows, rate=lambda)
        df[[col_name]] <- vals
        d=d+1
      }


  }
  return(df)
}

result_df <- random_df(12,3)
print(result_df)

