#' Read a macOS property list file
#'
#' @md
#' @param path path to `plist` file
#' @return `list` with property list contents or `NULL` if there was an error
#'         reading the property list.
#' @export
read_plist <- function(path) {
  .read_plist <- purrr::safely(plistlib$readPlist)
  path <- path.expand(path[1])
  if (!file.exists(path)) stop("File not found.", call.=FALSE)
  res <- .read_plist(path)
  res$result
}