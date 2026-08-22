# Extracted from test-lehdr.R:276

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
expect_error(
    grab_lodes(
      state      = "de",
      year       = 2020,
      version    = "LODES7",
      lodes_type = "wac"
    ),
    "outside the valid range"
  )
