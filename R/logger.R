#' Log a message to the macOS logging system (searchable from Console.app)
#'
#' @param app name of the "application" (makes it easier to search for your log entries)
#' @param message text to write to the log
#' @export
logger <- function(message, app = "mactheknife") {

  system2(
    command = "/usr/bin/logger",
    args = sprintf("%s: %s", app, message[1])
  ) -> catch

}