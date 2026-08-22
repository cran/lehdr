# Extracted from test-lehdr.R:1048

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
stub <- data.frame(
    w_county = character(),
    CE01     = integer(),
    CE02     = integer(),
    CE03     = integer()
  )
expect_error(
    compute_earnings_share(stub, type = "od"),
    "'arg' should be one of"
  )
