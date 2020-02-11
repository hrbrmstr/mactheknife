#' Return a data frame of macOS Spotlight Metadata Attributes for the specified paths
#'
#' @param paths paths to files
#' @export
#' @examples
#' mdls(
#'   list.files(
#'     pathj = file.path(find.package("mactheknife")),
#'     recursive = TRUE,
#'     full.names = TRUE
#'   )
#' )
mdls <- function(paths) {

  mdls_cmd <- Sys.which("mdls")
  if (mdls_cmd == "") {
    stop("mdls command not found. Are you running on macOS?", call.=FALSE)
  }

  paths <- path.expand(paths)

  tf <- tempfile(fileext = ".plist")

  lapply(paths, function(.x) {

    if (file.exists(.x)) {
      system2(mdls_cmd, args = c("-plist", tf, .x))
      res <- XML::readKeyValueDB(tf)
      tolist <- which(lengths(res) > 1)
      if (length(tolist)) {
        for (idx in tolist) {
          res[[idx]] <- I(list(res[[idx]]))
        }
      }
      res <- as.data.frame(res, stringsAsFactors = FALSE)
      class(res) <- c("tbl_df", "tbl", "data.frame")
      res
    } else {
      NULL
    }

  }) -> out

  dplyr::bind_rows(out)

}