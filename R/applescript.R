#' Execute AppleScript and Return Results
#'
#' @md
#' @param script_source character vector of valid applescript source lines.
#'        They will be turned into a single script file with a newline inserted
#'        between each element of the vector.
#' @param extra_args the `applescript` binary takes arguments but we only
#'        use the filename execution so you can place any other arguments
#'        for it here. NOTE that there is a separate parameter for specifying
#'        parameters
#' @param param a character vector of parameters to pass to the invokation.
#' @return anything the script returns (invisibly).
#' @note `stdout` is captured and returned but `stderr` (if any) is displayed in the console.
#' @export
#' @examples \dontrun{
#' # open a folder
#' applescript(
#'   sprintf(
#'     'tell app "Finder" to open POSIX file "%s"',
#'     Sys.getenv("R_DOC_DIR")
#'   )
#' )
#'
#'
#' # talk to an app and return data
#' res <- applescript('
#' tell application "iTunes"
#'   set r_name to name of current track
#'   set r_artist to artist of current track
#' end
#' return "artist=" & r_artist & " || track=" & r_name
#' ')
#'
#' print(res)
#' }
applescript <- function(script_source, extra_args = c(), params = c()) {

  script_source <- paste0(script_source, collapse = "\n")

  tf <- tempfile(fileext = ".applescript")
  on.exit(unlink(tf), add=TRUE)

  cat(script_source, file = tf)

  osascript <- Sys.which("osascript")

  args <- c(extra_args, tf, params)

  system2(
    command = osascript,
    args = args,
    stdout = TRUE
  ) -> res

  invisible(res)

}
