# Extracted from test-lehdr.R:877

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
single_year <- data.frame(w_county = "10001", C000 = 100L, year = 2020L)
expect_error(
    compute_lodes_change(single_year, geo_col = "w_county"),
    "at least two distinct years"
  )
