#' Temporary Shorcut For Reading Arrow/Parquet Bit Into R via 'reticulate'
#'
#' Work is being done to make Parquet/Arrow a first-class R citizen
#' but -- until then -- I don't always want a Drill server round trip just
#' to read in some data and same goes for firing up a Spark instance (srsly).
#' So, this is a quick hack until the R packages are done.
#'
#' @md
#' @name sparrow
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import reticulate
#' @import dplyr
NULL
