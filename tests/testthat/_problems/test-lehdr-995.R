# Extracted from test-lehdr.R:995

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
wac <- grab_lodes(
    state      = "de",
    year       = 2020,
    version    = "LODES8",
    lodes_type = "wac",
    job_type   = "JT00",
    segment    = "S000",
    agg_geo    = "county"
  )
result <- compute_earnings_share(
    wac,
    type    = "wac",
    geo_col = "w_county",
    output  = "long"
  )
