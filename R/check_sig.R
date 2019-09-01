#' Check application signature/notarization information
#'
#' @param path_to_app the path to the application or comand line binary
#' @export
check_sig <- function(path_to_app) {

  path_to_app <- path.expand(path_to_app[1])
  stopifnot(file.exists(path_to_app))

  codesign <- Sys.which("codesign")

  res <- try(sys::exec_internal(codesign, arg = c("-dvvvv", path_to_app)), silent = TRUE)
  if (inherits(res, "try-error")) return(NULL)

  if (res$status != 0) {
    stop("Error running codesign utility. Are you on macOS?", call.=FALSE)
  }

  out <- rawToChar(res$stderr)
  out <- unlist(stringi::stri_split_lines(out))
  out <- out[out != ""]
  out <- stringi::stri_split_fixed(out, "=", n=2, simplify=TRUE)
  out <- as.data.frame(out, stringsAsFactors=FALSE)
  out <- dplyr::as_tibble(out)
  colnames(out) <- c("key", "value")

  out

}
