# Extracted from test-lehdr.R:252

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
expect_error(
    grab_lodes(
      state      = "de",
      year       = 2023,
      version    = "LODES8",
      lodes_type = "wac"
    ),
    "outside the valid range"
  )
