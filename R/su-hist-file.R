#' Retrieve Software Update history
#'
#' Modern macOS "Software Update" history is preserved in the
#' `/Library/Receipts/InstallHistory.plist` proeprty list file. The default
#' behaviour is to use this file as a source and parse the property list into
#' a data frame (tibble). The caller can also provide a path to a valid
#' property list "Software Update" history file (i.e. a systems administrator
#' may want to analyze a collected inventory of "Software Update" history files
#' from all the macOS systems on her network).
#'
#' @md
#' @param su_hist_file path to "Software Update" history file
#' @export
software_update_history <- function(su_hist_file = "/Library/Receipts/InstallHistory.plist") {

  su_hist_file <- path.expand(su_hist_file)
  su_hist_file <- normalizePath(su_hist_file)

  if (!file.exists(su_hist_file)) stop("'hist_file' not found.", call.=FALSE)

  doc <- xml2::read_xml(su_hist_file)
  kids <- xml2::as_list(xml2::xml_children(doc))

  shld_be_dict <- unique(names(kids[[1]]))
  if (!((length(shld_be_dict) == 1) & (shld_be_dict[1] == "dict"))) {
    stop("Not a valid plist file.", call.=FALSE)
  }

  purrr::map_df(1:length(kids[[1]]), function(.j) {
    grandkids <- kids[[1]][[.j]]
    nm <- names(grandkids)
    keys <- which(nm == "key")
    dat <- vector("list", length(keys))
    keynms <- vector("character", length(keys))
    j <- 1
    for (i in keys) {
      key_name <- grandkids[[i]][[1]]
      keynms[j] <- key_name
      val_type <- names(grandkids[i+1])
      val <- switch(
        val_type,
        "string" = unlist(grandkids[[i+1]]),
        "date" = anytime::anytime(unlist(grandkids[[i+1]])),
        "integer" = as.integer(unlist(grandkids[[i+1]])),
        "real" = as.numeric(unlist(grandkids[[i+1]])),
        "true" = TRUE,
        "false" = FALSE,
        "array" = list(purrr::set_names(list(unlist(grandkids[[i+1]], use.names=FALSE)), key_name)),
        "data" = "TODO",
        "UNKNOWN - TODO"
      )
      if (length(val) == 0) val <- NA
      dat[j] <- as.list(val)
      j <- j + 1
    }
    purrr::set_names(dat, keynms)
  }) -> xdf

  xdf[,c("displayName", "displayVersion", "date", "packageIdentifiers", "processName", "contentType")]

}
