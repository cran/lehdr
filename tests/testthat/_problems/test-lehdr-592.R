# Extracted from test-lehdr.R:592

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
expect_message(
    grab_lodes(
      state      = "vt",
      year       = 2008,
      version    = "LODES5",
      lodes_type = "wac",
      job_type   = "JT01",
      segment    = "SA01",
      state_part = "main",
      agg_geo    = "county",
      geometry   = TRUE
    )
  )
