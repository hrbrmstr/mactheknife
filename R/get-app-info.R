#' Retrieve iTunes info about a give app (via bundle id)
#'
#' @param bundle_id an app bundle id
#' @export
get_app_info <- function(bundle_id) {

  bundle_id <- bundle_id[1]

  if (grepl("^com\\.apple\\.", bundle_id)) {

    tibble(
      app = bundle_id,
      name = stringi::stri_trans_totitle(sub("^com\\.apple\\.", "", bundle_id)),
      category = "Apple"
    )

  } else {

    httr::GET(
      url = "https://itunes.apple.com/lookup",
      query = list(
        bundleId = bundle_id
      )
    ) -> res

    httr::stop_for_status(res)

    out <- jsonlite::fromJSON(httr::content(res, as = "text"))

    if (length(out$resultCount)) {

      tibble(
        app = bundle_id,
        name = out$results$trackName,
        category = out$results$primaryGenreName
      )

    } else {

      tibble(
        app = bundle_id,
        name = NA_character_,
        category = NA_character_
      )

    }

  }

}