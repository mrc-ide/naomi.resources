#' Load dependencies for AGYW PSE tool
#'
#' @return Data input for AGYW PSE tool.
#'
#' @param data Name of data dependency (see below for full description).
#' @param iso3 Country iso3
#'
#' @return Loaded AGYW data.
#'
#' @export
load_agyw_exdata <- function(data, iso3) {
  assert_scalar_character(data)
  assert_scalar_character(iso3)
  country_data <- get_country_data_path(
    system_file(file.path("extdata", "agyw")),
    iso3)

  if (data == "zaf_propensity" && toupper(iso3) != "ZAF") {
    cli::cli_abort("Can't get zaf_propensity data for country '{iso3}'.")
  }

  path <- switch(
    data,
    "srb_female" = file.path("female_best-3p1-multi-sexbehav-sae.csv"),
    "srb_male" = file.path("male_best-3p1-multi-sexbehav-sae.csv"),
    "srb_survey_lor" = file.path("prevalence_lor.csv"),
    "kp_estimates" = file.path("kp_estimates.csv"),
    "afs" = file.path("kinh_afs_dist.csv"),
    "zaf_propensity" = file.path("zaf_propensity.csv"),
    cli::cli_abort("Can't locate data of type '{data}'.")
  )

  path <- file.path(country_data, path)
  read_naomi_resource(path)
}

#' Get the path to the workbook template
#'
#' @param iso3 Country iso3
#'
#' @return Path to the workbook template
#'
#' @export
get_agyw_workbook_path <- function(iso3) {
  assert_scalar_character(iso3)
  agyw_data_root <- system_file(file.path("extdata", "agyw"))
  country_data <- get_country_data_path(agyw_data_root, iso3)

  file.path(country_data, "pse_workbook_template.xlsx")
}

get_country_data_path <- function(agy_data_path, iso3) {
  available_iso3 <- list.files(agy_data_path)
  if (!(tolower(iso3) %in% tolower(available_iso3))) {
    available <- paste(available_iso3, collapse = "', '")
    cli::cli_abort(c("Can't locate data for iso3 '{iso3}'",
                     i = "Available countries are '{available}'."))
  }
  invisible(file.path(agy_data_path, toupper(iso3)))
}

read_naomi_resource <- function(path) {
  readr::read_csv(path, show_col_types = FALSE)
}

system_file <- function(...) {
  system.file(..., package = "naomi.resources", mustWork = TRUE)
}

