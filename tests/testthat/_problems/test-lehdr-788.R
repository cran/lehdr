# Extracted from test-lehdr.R:788

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
wac <- grab_lodes(
    state      = c("de", "vt"),
    year       = c(2017, 2019),
    version    = "LODES8",
    lodes_type = "wac",
    job_type   = "JT00",
    segment    = "S000",
    agg_geo    = "county"
  )
result <- compute_lodes_change(
    wac,
    geo_col      = "w_county",
    base_year    = 2017,
    compare_year = 2019,
    variables    = "C000",
    output       = "long"
  )
