# Extracted from test-lehdr.R:886

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
no_year <- data.frame(w_county = "10001", C000 = 100L)
expect_error(
    compute_lodes_change(no_year, geo_col = "w_county"),
    "`year` column"
  )
