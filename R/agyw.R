#' Load dependencies for AGYW PSE tool
#'
#' @return Data input for AGYW PSE tool.
#'
#' @param data Name of data dependency (see below for full description).
#' @param iso3 Country iso3
#'
#' @export

load_agyw_exdata <- function(data, iso3) {

  agyw_data_root <- system_file(file.path("extdata", "agyw"))
  validate_inputs(agyw_data_root, data, iso3)
  iso3 <- toupper(iso3)

  path <- switch(
    data,
    "srb_female" = file.path(iso3, "female_best-3p1-multi-sexbehav-sae.csv"),
    "srb_male" = file.path(iso3, "male_best-3p1-multi-sexbehav-sae.csv"),
    "srb_survey_female" = file.path(iso3, "male_best-3p1-multi-sexbehav-sae.csv"),
    "srb_survey_male" = file.path(iso3, "male_hiv_indicators_sexbehav.csv"),
    "fsw_pse" = file.path(iso3, "fsw_pse.csv"),
    "msm_pse" = file.path(iso3, "msm_pse.csv"),
    "pwid_pse" = file.path(iso3, "pwid_pse.csv"),
    "afs" = file.path(iso3, "kinh_afs_dist.csv"),
    "zaf_propensity" = file.path("ZAF", "zaf_propensity.csv"),
    cli::cli_abort("Can't locate data of type '{data}'.")
  )

  path <- file.path(agyw_data_root, path)
  read_naomi_resource(path)
}

validate_inputs <- function(agy_data_path, data, iso3) {
  assert_scalar_character(iso3)
  assert_scalar_character(data)

  available_iso3 <- list.files(agy_data_path)
  if (!(tolower(iso3) %in% tolower(available_iso3))) {
    available <- paste(available_iso3, collapse = "', '")
    cli::cli_abort(c("Can't locate data for iso3 '{iso3}'",
                     i = "Available countries are '{available}'."))
  }
}

read_naomi_resource <- function(path) {
  readr::read_csv(path, show_col_types = FALSE)
}

system_file <- function(...) {
  system.file(..., package = "naomi.resources", mustWork = TRUE)
}

