# Extracted from test-lehdr.R:733

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
od_stub <- data.frame(
    h_tract = character(),
    w_tract = character(),
    S000    = integer(),
    year    = integer()
  )
expect_error(
    compute_commute_stats(od_stub, agg_geo = "zipcode"),
    "'arg' should be one of"
  )
