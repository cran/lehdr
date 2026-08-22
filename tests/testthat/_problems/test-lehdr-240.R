# Extracted from test-lehdr.R:240

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
expect_error(
    grab_lodes(
      state      = "MARYLAND",
      year       = 2020,
      version    = "LODES8",
      lodes_type = "wac"
    ),
    "not a recognized"
  )
