#' Source the `knowledgeC.db` on the local system
#'
#' @param knowledgeC_location location of the `knowledgeC.db` file (defaults to "`~/Library/Application Support/Knowledge/knowledgeC.db`")
#' @export
src_knowledgeC <- function(knowledgeC_location = "~/Library/Application Support/Knowledge/knowledgeC.db") {
  dplyr::src_sqlite(knowledgeC_location)
}

