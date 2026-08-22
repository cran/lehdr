# Extracted from test-lehdr.R:1034

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
od_stub <- data.frame(
    w_tract = "10001001",
    h_tract = "10001002",
    S000    = 50L,
    year    = 2020L
  )
expect_error(
    compute_earnings_share(od_stub, type = "wac", geo_col = "w_tract"),
    "CE0"
  )
