dsstore <- NULL
os <- NULL

.onLoad <- function(libname, pkgname) {
  dsstore <<- reticulate::import_from_path(
    module = "dsstore",
    path = system.file("modules", package = "mactheknife"),
    delay_load = TRUE
  )
  os <<- reticulate::import("os", delay_load = TRUE)
}