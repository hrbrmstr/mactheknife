#' Retrieve macOS Operating System Version Information
#'
#' @return data frame (tibble)
#' @export
sw_vers <- function() {

  res <- sys::exec_internal("sw_vers")

  if (length(res$stdout) == 0) {
    stop('Error retrieving macOS version info. Are you running on macOS?', call.=FALSE)
  }

  out <- rawToChar(res$stdout)

  purrr::map_dfc(strsplit(out, "\n")[[1]], ~{
    .x <- strsplit(.x, "\t")[[1]]
    as.list(purrr::set_names(.x[2], gsub(":", "", .x[1])))
  }) -> out

  case_when(
    grepl("^10\\.0$|^10\\.0\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.0 (Cheetah)",
    grepl("^10\\.1$|^10\\.1\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.1 (Puma)",
    grepl("^10\\.2$|^10\\.2\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.2 (Jaguar)",
    grepl("^10\\.3$|^10\\.3\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.3 (Panther)",
    grepl("^10\\.4$|^10\\.4\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.4 (Tiger)",
    grepl("^10\\.5$|^10\\.5\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.5 (Leopard)",
    grepl("^10\\.6$|^10\\.6\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.6 (Snow Leopard)",
    grepl("^10\\.7$|^10\\.7\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.7 (Lion)",
    grepl("^10\\.8$|^10\\.8\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.8 (Mountain Lion)",
    grepl("^10\\.9$|^10\\.9\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.9 (Mavericks)",
    grepl("^10\\.10$|^10\\.10\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.10 (Yosemite)",
    grepl("^10\\.11$|^10\\.11\\.[0-9]*$", out$ProductVersion) ~ "Mac OS X 10.11 (El Capitan)",
    grepl("^10\\.12$|^10\\.12\\.[0-9]*$", out$ProductVersion) ~ sprintf("macOS Sierra (%s)", out$ProductVersion),
    grepl("^10\\.13$|^10\\.13\\.[0-9]*$", out$ProductVersion) ~ sprintf("macOS High Sierra (%s)", out$ProductVersion),
    TRUE ~ "Unknown"
  ) -> out$ProductFullName

  out$Hardware <- system("uname -m", intern=TRUE)
  out$KernelVersion <- system("uname -r", intern=TRUE)

  out

}


