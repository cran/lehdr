# Extracted from test-lehdr.R:452

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "lehdr", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_options(list(lehdr_use_cache = TRUE))
result <- grab_crosswalk("vt", version = "LODES7")
