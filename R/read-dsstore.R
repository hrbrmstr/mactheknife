#' Read a `.DS_Store` file
#'
#' @md
#' @param path a path to a valid `.DS_Store` file ([path.expand()] will be called)
#' @return a character vector of filenames in the `.DS_Store` file or
#'         a length 0 character vector if no parseable data was found
#' @export
#' @examples
#' read_dsstore(system.file("extdat", "DS_Store.ctf", package = "mactheknife"))
read_dsstore <- function(path) {

  stor_path <- path.expand(path)
  stor_path <- normalizePath(stor_path)

  fil <- os$open(stor_path, os$O_RDONLY)
  contents <- os$read(fil, as.integer(file.size(stor_path)))
  os$close(fil)

  d <- dsstore$DS_Store(contents)

  ds_fils <- d$traverse_root()

  out <- unique(ds_fils)

  if (length(out) == 0) out <- character()

  out

}
