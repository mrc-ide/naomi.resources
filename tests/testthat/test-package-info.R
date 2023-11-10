test_that("can get info about a countries data", {
  info <- get_resources_info("BWA")
  expect_equal(info$version, tools::packageVersion("naomi.resources"))
  expect_true(grepl("https://github.com/mrc-ide/", info$url, fixed = TRUE))
  expect_equal(colnames(info$files), c("filename", "hash"))
  expect_true(all(grepl("extdata/agyw/BWA/", info$files$filename,
                        fixed = TRUE)))
})
