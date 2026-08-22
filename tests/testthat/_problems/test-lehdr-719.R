# Extracted from test-lehdr.R:719

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
bad_df <- data.frame(h_tract = "11001", w_tract = "11002", year = 2020L)
expect_error(
    compute_commute_stats(bad_df, agg_geo = "tract"),
    "S000"
  )
