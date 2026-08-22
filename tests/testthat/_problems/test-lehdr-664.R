# Extracted from test-lehdr.R:664

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
od <- grab_lodes(
    state      = "de",
    year       = 2020,
    version    = "LODES8",
    lodes_type = "od",
    job_type   = "JT00",
    segment    = "SA01",
    state_part = "main",
    agg_geo    = "tract"
  )
result <- compute_commute_stats(od, agg_geo = "tract")
