#' Get info about resources for a country
#'
#' This returns a list containing
#'   * The version of the package installed
#'   * The URL from the DESCRIPTION
#'   * A data frame with the files and their hashes for this country
#'
#' @param iso3 Country iso3 to get resources info for
#'
#' @return A list containing info about resources for this country
#' @export
get_resources_info <- function(iso3) {
  assert_scalar_character(iso3)
  root <- system_file()
  country_data <- get_country_data_path(file.path(root, "extdata", "shipp"),
                                        iso3)

  files <- list.files(country_data, full.names = TRUE)
  country_relative_path <- sub(paste0(root, "/"), "", country_data)
  relative_paths <- file.path(country_relative_path, basename(files))
  hash <- unname(tools::md5sum(files))

  resources_version <- utils::packageVersion("naomi.resources")
  resources_url <- utils::packageDescription("naomi.resources")$URL

  list(
    version = resources_version,
    url = resources_url,
    files = data.frame(filename = relative_paths, hash = hash)
  )
}
