dataGen
2025-04-30
Three functions
1. df_generator
2. inject_NA
3. random_df
df_generator
Inputs:
rows (int) * number of rows
date_col (str) * name of date column
date_range (vector) * range for date column
int_col (string) * name for int column
int_range (vector) * range for int column
float_col (string) * name for float column
float_min (int) * float column min
float_max (int) *. float column max
boolean_col (string) * boolean column name
letters_col (string) * letter column name
distribution_col (string) * distribution column name
dist_type (string) * type of distribution (normal, binomial, uniform)
dist_params (list) * parameters for the distribution column
user_col (string) * name for the user column
user_data (vector) * data to be sampled with replacement
unique_user_col (string) * name for unique user data column
unique_user (vector) * data to be sampled without replacement
missing (string) * name of columns to insert “NAs” into
n_missing (int) * number of missing data points to inject
id_col (string) * name for id column (sequence 1:rows)
unique_id (string) * name for unique id column
id_digits (int) * how many digits in the unique id
id_prefix (string) * id prefix
Purpose
df_generator generates data frames based on the users specifications. It can input columns with dates, integers, floats, letters, ids, unique ids, booleans, distributions (normal, binomial, or uniform), and sample from user data (with or without replacement)

Example
library(dataGen)
result <- df_generator(
  rows = 15,


  date_col = "enrollment_date",



  int_col = "test_result",
  int_range = c(50, 100),


  float_col = "GPA",
  float_min = 2.0,
  float_max = 4.0,


  boolean_col = "passed",


  letters_col = "last_name_initial",


  user_col = "department",
  user_data = c("Math", "Biology", "History", "CS", "Info_Science"),


  unique_user_col = "email",
  unique_user = paste0("student", 1:15, "@usf.edu"),


  distribution_col = "SAT",
  dist_type = "normal",
  dist_params = list(mean = 1200, sd = 300),


  missing = "test_result",
  n_missing = 3,


  id_col = "student_index",


  unique_id = "student_id",
  id_digits = 7,
  id_prefix = "U"
)
print(result$generated_df)
## NULL
print(result$df)
## NULL
inject_NA
Inputs:
df(data frame) * your data frame
columns(string) * which columns to add missing values
missing_percentage(int) * percent of data to be missing
Purpose
inject_na injects NA values into the given data frame into the choosen columns at a certain percentage

Example
library(dataGen)
df <- iris
df_new <- inject_NA(iris, c("Sepal.Length", "Sepal.Width", "Petal.Width"), 10 )
df_new
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0          NA          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4          NA     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1          NA     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19            NA         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23            NA         3.6          1.0          NA     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8          NA          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2          NA          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2          NA          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35            NA         3.1          1.5         0.2     setosa
## 36            NA         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3          NA     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4          NA          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9          NA     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50            NA         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57            NA         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6          NA versicolor
## 60            NA         2.7          3.9         1.4 versicolor
## 61           5.0          NA          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63            NA         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8          NA versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83            NA         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5          NA versicolor
## 87           6.7          NA          4.7         1.5 versicolor
## 88            NA         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90            NA         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4          NA versicolor
## 92           6.1          NA          4.6         1.4 versicolor
## 93           5.8          NA          4.0         1.2 versicolor
## 94            NA         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2          NA versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3          NA versicolor
## 99           5.1          NA          3.0         1.1 versicolor
## 100          5.7         2.8          4.1          NA versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6          NA          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2          NA          6.1         2.5  virginica
## 111          6.5          NA          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1          NA  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119           NA         2.6          6.9          NA  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126           NA         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4          NA  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146           NA          NA          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2          NA          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
random_df
Inputs:
rows (int) * number of rows
cols(int) * number of columns
Purpose
random_df generates a data frame with the specified number of rows and columns using randomly selected distributions (normal, binomial, uniform, poisson, and exponential) with randomly selected parameters

Example
library(dataGen)
result_df <- random_df(12,3)
print(result_df)
##    exponential1  uniform1 binomial1
## 1   0.005461935 106.01076        20
## 2   0.001304886 151.73406        27
## 3   0.014245495 124.68276        24
## 4   0.006185152  94.13535        25
## 5   0.012810417 124.35964        20
## 6   0.005392561 105.84367        19
## 7   0.003522456 127.31526        23
## 8   0.001389980 138.99357        15
## 9   0.016185787 137.52157        24
## 10  0.005144647 141.47808        22
## 11  0.006070898 126.28677        21
## 12  0.001224147 145.07037        18
