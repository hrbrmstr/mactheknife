#' Check application notarization info
#'
#' @param path_to_app the path to the application or comand line binary
#' @export
check_notarization <- function(path_to_app) {

  vers <- sw_vers()
  stopifnot(utils::compareVersion(vers$ProductVersion[1], "10.14") >= 0)

  path_to_app <- path.expand(path_to_app[1])
  stopifnot(file.exists(path_to_app))

  spctl <- Sys.which("spctl")

  res <- sys::exec_internal(spctl, arg = c("-a", "-vv", path_to_app))

  if (res$status != 0) {
    stop("Error running spctl utility Are you on macOS?", call.=FALSE)
  }

  out <- rawToChar(res$stderr)
  out <- unlist(stringi::stri_split_lines(out))
  out <- out[out != ""]

  app_status <- dplyr::tibble(
    key = c("application", "status"),
    value = trimws(unlist(stri_split_fixed(out[1], ":", 2)))
  )

  out <- stringi::stri_split_fixed(out[2:length(out)], "=", n=2, simplify=TRUE)
  out <- as.data.frame(out, stringsAsFactors=FALSE)
  out <- dplyr::as_tibble(out)
  colnames(out) <- c("key", "value")

  out <- dplyr::bind_rows(app_status, out)

  out

}
