test_that("can get SHIPP data for a country", {
  data_types <- c("srb_female", "srb_male", "srb_survey_lor",
                  "kp_estimates", "afs")

  for (data_type in data_types) {
    tryCatch(
      data <- load_shipp_exdata(data_type, "MWI"),
      error = function(e) {
        e$message <- c(sprintf("Failed for data_type: '%s'", data_type), e$message)
        stop(e)
      }
    )
    ## Simple smoke test that there is some data, we should probably also
    ## check that the columns we expect to exist do so
    expect_true(nrow(data) > 5,
                info = sprintf("Failed for data_type: '%s'", data_type))
    expect_true(ncol(data) > 3,
                info = sprintf("Failed for data_type: '%s'", data_type))
  }
})

test_that("can get zaf_propensity data", {
  data <- load_shipp_exdata("zaf_propensity", "ZAF")
  expect_equal(nrow(data), 14)
  expect_equal(ncol(data), 3)
})

test_that("can get goals data", {
  data <- load_shipp_exdata("goals", "SSA")
  expect_equal(nrow(data), 39)
  expect_equal(ncol(data), 11)
})

test_that("can get path to workbook template", {
  expect_silent(get_shipp_workbook_path())
})

test_that("informative error thrown if iso3 or data unknown", {
  expect_error(
    load_shipp_exdata("srb_female", "UNK"),
    "Can't locate data for iso3 'UNK'."
  )

  expect_error(
    load_shipp_exdata("data_type", "MWI"),
    "Can't locate data of type 'data_type'."
  )
})
