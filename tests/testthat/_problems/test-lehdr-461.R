# Extracted from test-lehdr.R:461

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
rows_lodes8 <- nrow(grab_crosswalk("vt", version = "LODES8"))
