#' Load dependencies for AGYW PSE tool
#'
#' @return Data input for AGYW PSE tool.
#'
#' @param data Name of data dependency (see below for full description).
#' @param iso3 Country iso3
#'
#' @export

load_agyw_exdata <- function(data, iso3, kp = NULL){

  if(data == "srb_female"){
    path <- file.path("extdata/agyw", iso3, "female_best-3p1-multi-sexbehav-sae.csv")
    x <- readr::read_csv(system.file(path, package = "naomi.resources", mustWork = TRUE),
                         show_col_types = FALSE)
  }

  if(data == "srb_male"){
    path <- file.path("extdata/agyw", iso3, "male_best-3p1-multi-sexbehav-sae.csv")
    x <- readr::read_csv(system.file(path, package = "naomi.resources", mustWork = TRUE),
                         show_col_types = FALSE)
  }

  if(data == "srb_survey_lor"){
    path <- file.path("extdata/agyw", iso3, "prevalence_lor.csv")
    x <- readr::read_csv(system.file(path, package = "naomi.resources", mustWork = TRUE),
                         show_col_types = FALSE)
  }


  if(data == "fsw_pse"){
    path <- file.path("extdata/agyw", iso3, "fsw_pse.csv")
    x <- readr::read_csv(system.file(path, package = "naomi.resources", mustWork = TRUE),
                    show_col_types = FALSE)
  }

  if(data == "kp_pse"){
    path <- file.path("extdata/agyw", iso3, "pse.csv")
    x <- readr::read_csv(system.file(path, package = "naomi.resources", mustWork = TRUE),
                         show_col_types = FALSE)
  }


  if(data == "zaf_propensity"){
    path <- "extdata/agyw/ZAF/zaf_propensity.csv"
    x <- readr::read_csv(system.file(path, package = "naomi.resources", mustWork = TRUE),
                         show_col_types = FALSE)
  }

  x

}




