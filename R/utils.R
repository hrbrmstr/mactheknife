is_url <- function(path) {
  grepl("^(http|ftp)s?://", path)
}

mlga <- function(x) {
  x <- tolower(x)
  x <- gsub("[[:punct:][:space:]]+", "_", x)
  x <- gsub("_+", "_", x)
  x <- gsub("(^_|_$)", "", x)
  x <- make.unique(x, sep = "_")
  x
}
