#' Read a `.DS_Store` from a file/URL
#'
#' @md
#' @param path a path to a valid `.DS_Store` file ([path.expand()] will be called) _or_
#'        a link to an `http[s]` reachable `.DS_Store` file. If a URL, [download.file()]
#'        will be used to retrieve the remote `.DS_Store` file (to reduce package
#'        dependencies).
#' @return a character vector of filenames in the `.DS_Store` file or
#'         a length 0 character vector if no parseable data was found
#' @export
#' @references A thin wrapper around the 'Python' 'dsstore' module <https://github.com/gehaxelt/Python-dsstore> by 'Sebastian Neef'.
#' @examples
#' read_dsstore(system.file("extdat", "DS_Store.ctf", package = "mactheknife"))
read_dsstore <- function(path) {

  path_is_url <- FALSE

  if (is_url(path)) {
    path_is_url <- TRUE
    remote_path <- path
    path <- tempfile(fileext = ".dsstore.tmp")
    on.exit(unlink(path))
    ret <- download.file(remote_path, path, quiet = TRUE, mode = "wb")
    if (ret != 0) {
      warning(".DS_Store file not found at the provided URL.")
      return(character())
    }
  }

  stor_path <- path.expand(path)
  stor_path <- normalizePath(stor_path)

  if ((!path_is_url) & (!file.exists(stor_path))) {
    warning(".DS_Store file not found at specified path.")
    return(character())
  }

  fil <- os$open(stor_path, os$O_RDONLY)
  contents <- os$read(fil, as.integer(file.size(stor_path)))
  os$close(fil)

  d <- try(dsstore$DS_Store(contents), silent = TRUE)
  if (inherits(d, "try-error")) {
    warning("Not a valid .DS_Store file.")
    return(character())
  }

  ds_fils <- d$traverse_root()

  out <- unique(ds_fils)

  if (length(out) == 0) out <- character()

  return(out)

}
