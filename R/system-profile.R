#' Report system hardware and software configuration
#'
#' TODO Do more than just return an xml document once a generica plist reader
#' is created.
#'
#' @md
#' @note Even the `mini` option takes a noticeable amount of time to complete.
#' @param detail_level how much information to return:
#' - `mini` report with no personal information
#' - `basic` basic hardware and network information
#' - `full` all available information
#' @export
system_profile <- function(detail_level = c("mini", "basic", "full")) {

  match.arg(
    tolower(trimws(detail_level[1])),
    c("mini", "basic", "full")
  ) -> detail_level

  sys::exec_internal(
    "system_profiler",
    c("-xml", "-detailLevel", "mini")
  ) -> res

  if (res$status != 0) {
    stop("Error running system profiler. Are you on macOS?", call.=FALSE)
  }

  xml2::read_xml(res$stdout)

}

