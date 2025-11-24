#' Load dependencies for SHIPP PSE tool
#'
#' @return Data input for SHIPP PSE tool.
#'
#' @param data Name of data dependency (see below for full description).
#' @param iso3 Country iso3
#'
#' Subnational boundaries represent subnational administrative units used by UNAIDS sourced from
#'
#' @return Loaded SHIPP data.
#'
#' @export
load_shipp_exdata <- function(data, iso3) {
  assert_scalar_character(data)
  assert_scalar_character(iso3)
  country_data <- get_country_data_path(
    system_file(file.path("extdata", "shipp")),
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
    "afs" = file.path("age_sex_fertility_rates.csv"),
    "zaf_propensity" = file.path("zaf_propensity.csv"),
    "goals" = file.path("goals_results.csv"),
    cli::cli_abort("Can't locate data of type '{data}'.")
  )

  path <- file.path(country_data, path)
  read_naomi_resource(path)
}

#' Get the path to the workbook template
#'
#' @return Path to the workbook template
#'
#' @export
get_shipp_workbook_path <- function() {
  system_file(file.path("extdata", "shipp"), "shipp_tool_all_ages_sexes_singlecountry_template.xlsx")
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

#' Get year of SRB estimates from SHIPP workbook template
#'
#' @return Year of SRB estimates to use in SHIPP calculations. Based on most recent
#' survey or set to 2018 is most recent survey is older than 2018. Harcoded into
#' SHIPP workbook template on "County Model" tab.
#' @param iso3 Country iso3
#'
#' @export
get_srb_year <- function(iso3){

  assert_scalar_character(iso3)
  wb_path <- get_shipp_workbook_path()
  survey_meta <- readxl::read_excel(wb_path, sheet = "Model inputs",
                                    range = "B6:F41")
  srb_year <- survey_meta[survey_meta$iso3 == iso3,]$`Sexual risk behaviour estimates`

}

