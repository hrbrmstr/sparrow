.py_conf <- reticulate::py_config()

if (utils::compareVersion(.py_conf$version, "3.5") < 0) {
  stop(
    paste0(
      c(
        "Python 3.5+ is required. If this is installed please set RETICULATE_PYTHON ",
        "to the path to the Python 3 binary on your system and try re-installing/",
        "re-loading the package."
      ),
      collapse = ""
    )
  )
}

if (!py_module_available("pyarrow")) stop("Please install the 'pyarrow' module", call.=FALSE)
if (!py_module_available("pandas")) stop("Please install the 'pandas' module", call.=FALSE)

.os <- NULL
.pyarrow <- NULL
.pandas <- NULL

.onLoad <- function(libname, pkgname) {

  .os <<- reticulate::import("os", delay_load = TRUE)
  .pyarrow <<- reticulate::import("pyarrow", delay_load = TRUE)
  .pandas <<- reticulate::import("pandas", delay_load = TRUE)

  if (!("read_parquet" %in% names(.pandas))) {
    stop("Your 'pandas' installation is out of date. Please upgrade.", call.=FALSE)
  }

}