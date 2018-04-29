#' Scan for available wireless network (requires Wi-Fi enabled Mac)
#'
#' @md
#' @param .quiet if `TRUE` then no progress messages will be displayed
#' @note that we have to use the characater output since the XML output is broken on Sierra.
#' @export
airport_scan <- function(.quiet=FALSE) {

  message("Scanning for available wireless networks...")

  sys::exec_internal(
    "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport",
    "-s"
  ) -> res

  if (length(res$stdout) == 0) {
    stop('Error scanning for networks Are you running on a Wi-Fi-enables macOS system?', call.=FALSE)
  }

  out <- rawToChar(res$stdout)
  out <- strsplit(out, "[\r\n]+")[[1]]
  out <- gsub("[\r\n]", "", out)

  rl <- rle(strsplit(gsub("[[A-Z]", "X", out[1]), "")[[1]])

  ssid_len <- sum(rl$lengths[1:3])
  bssid_len <- sum(rl$lengths[4:5])
  rssi_len <- sum(rl$lengths[6:7])
  channel_len <- sum(rl$lengths[8:9])
  ht_len <- sum(rl$lengths[10:11])
  cc_len <- sum(rl$lengths[12:13])
  security_start <- ssid_len + bssid_len + rssi_len + channel_len + ht_len + cc_len + 1

  saf <- default.stringsAsFactors()
  on.exit(options(stringsAsFactors = saf))
  options(stringsAsFactors = FALSE)

  con <- textConnection(paste0(out[2:length(out)], collaspe="\n"))
  read.fwf(
    file = con,
    widths = c(ssid_len, bssid_len, rssi_len, channel_len, ht_len, cc_len),
    stringsAsFactors = FALSE
  ) -> xdf
  close(con)

  xdf <- xdf[complete.cases(xdf),]
  xdf[] <- lapply(xdf, trimws)
  xdf <- type.convert(xdf, as.is=TRUE)

  xdf$security <-
    purrr::map_chr(out[2:length(out)], ~{
      substr(.x, security_start, nchar(.x))
    }) %>% trimws()

  colnames(xdf) <- c("ssid", "bssid", "rssi", "channel", "ht", "cc", "security")

  class(xdf) <- c("tbl_df", "tbl", "data.frame")
  xdf

}