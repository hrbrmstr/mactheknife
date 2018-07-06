x <- reticulate::py_config()

if (utils::compareVersion(x$version, "3.5") < 0) {
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

dsstore <- NULL
os <- NULL
plistlib <- NULL

.onLoad <- function(libname, pkgname) {
  dsstore <<- reticulate::import_from_path(
    module = "dsstore",
    path = system.file("modules", package = "mactheknife")
  )
  os <<- reticulate::import("os", delay_load = TRUE)
  plistlib <<- reticulate::import("plistlib", delay_load = TRUE)
}