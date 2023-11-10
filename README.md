
# naomi.resources

<!-- badges: start -->
<!-- badges: end -->


### Installation

The package is not available from [CRAN](https://cran.r-project.org/).
Instead, the latest version (of this Github repo) may be installed by running the following code from R.

```
# install.packages("devtools") # Uncomment this line if devtools is not yet installed
devtools::install_github("mrc-ide/naomi.resources")
```

### Developmement

To add or update a PSE workbook requires a little care
* Open the new workbook, remove the data in the sheets "All outputs - F", "All outputs - M", "NAOMI outputs", but don't delete the sheets. The data in these sheets will be populated by Naomi.
* Add a sheet called "Resources" this will hold the info about the naomi.resources used to generate the sheet

## License

MIT © Imperial College of Science, Technology and Medicine

