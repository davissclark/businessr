#' Format a dataframe's column names
#'
#' @param df A dateframe
#' @return The input dataframe with lower case column names, stripped of punctuation
#' @examples
#' format(mtcars)
format <- function(df) {
  names(df) <- tolower(names(df))
  names(df) <- gsub("[[:punct:]]", "", names(df), perl=TRUE)
  names(df) <- gsub(" ", "", names(df))
  df
}

dbcon <- function() {
  channel <<- RODBC::odbcConnect("sqlserver")
}

qury <- function(q, c=channel) {
  format(RODBC::sqlQuery(c, q))
}
