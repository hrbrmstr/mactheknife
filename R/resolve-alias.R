#' Resolve macOS Alias Files to POSIX path strings
#'
#' @md
#' @param path path to the target alias
#' @return character vector
#' @export
resolve_alias <- function(path) {

  if (file.exists(path[1])) {
    (applescript(sprintf('
set myPosix to POSIX file "%s"
tell application "Finder"
   set myPath to original item of item myPosix
end tell
set myPOSIXPath to POSIX path of (myPath as text)
return myPOSIXPath
', path.expand(path[1]))))
  } else {
    NULL
  }

}