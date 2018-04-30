.s_unlink <- purrr::safely(unlink)

#' Find and optionally remove `.DS_Store` files on a locally-accessible filesystem
#'
#' Provide a starting point, recursion option (similar to [list.files()]) &
#' whether or not to remove any `.DS_Store` files found and
#' get back a data frame of full paths to any `.DS_Store` files that exist
#' or were removed. The removal success status (if `remove` is `TRUE` will be added
#' as a column to the data frame).\cr\cr
#' If no `.DS_Store` files were found, an empty data frame is returned.
#'
#' @md
#' @param path a character vector of full path names; the default corresponds to
#'        the working directory, [getwd()]. Tilde expansion (see [path.expand()])
#'        is performed. Missing values will be ignored.
#' @param recursive logical. Should the listing recurse into directories? Default is `FALSE`.
#' @param remove if `TRUE` the function will attempt to [unlink()] any `.DS_Store`
#'        files found. Permissions issue may cause this option to fail to delete
#'        found `.DS_Store` files. Default: `FALSE`
#' @export
find_dsstore <- function(path = ".", recursive = FALSE, remove = FALSE) {

  list.files(
    path = path,
    pattern = "\\.DS_Store",
    all.files = TRUE,
    full.names = TRUE,
    recursive = recursive
  ) -> fils

  if (length(fils) > 0) {

    data.frame(
      path = fils,
      stringsAsFactors=FALSE
    ) -> ret

    if (remove) {

      purrr::map_lgl(fils, ~{

        res <- .s_unlink(.x, force = TRUE)
        if (is.null(res$result)) return(FALSE)
        return(res$result == 0)

      }) -> rm_status

      ret$removed <- rm_status
    }

  } else {
    ret <- data.frame(stringsAsFactors=FALSE)
  }

  class(ret) <- c("tbl_df", "tbl", "data.frame")

  ret

}