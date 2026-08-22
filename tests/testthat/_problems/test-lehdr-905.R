# Extracted from test-lehdr.R:905

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
wac <- grab_lodes(
    state      = "de",
    year       = c(2018, 2020),
    version    = "LODES8",
    lodes_type = "wac",
    job_type   = "JT00",
    segment    = "S000",
    agg_geo    = "county"
  )
expect_error(
    compute_lodes_change(wac, geo_col = "w_county", base_year = 2010),
    "2010"
  )
