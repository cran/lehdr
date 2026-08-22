# Extracted from test-lehdr.R:944

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
rac <- grab_lodes(
    state      = "de",
    year       = 2020,
    version    = "LODES8",
    lodes_type = "rac",
    job_type   = "JT00",
    segment    = "S000",
    agg_geo    = "county"
  )
result <- compute_earnings_share(rac, type = "rac", geo_col = "h_county")
