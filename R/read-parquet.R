#' Read in data from Parquet into an R data frame via `reticulate`
#'
#' @md
#' @param path path to Parquet file
#' @param columns optionally a character vector of columns to read (vs all the columns)
#' @export
read_parquet <- function(path, columns = NULL) {

  path <- path.expand(path)
  path <- normalizePath(path)

  if (!is.null(columns)) columns = as.list(columns)

  xdf <- .pandas$read_parquet(path, columns = columns)

  xdf <- as.data.frame(xdf, stringsAsFactors = FALSE)

  dplyr::tbl_df(xdf)

}