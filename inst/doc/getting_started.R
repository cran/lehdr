## ----setup, echo=FALSE, message=FALSE, warning=FALSE--------------------------
knitr::opts_chunk$set(
  collapse  = TRUE,
  comment   = "#>",
  eval      = FALSE
)

## ----install, eval=FALSE------------------------------------------------------
# # From CRAN
# install.packages("lehdr")
# 
# # Development version from GitHub
# devtools::install_github("jamgreen/lehdr")
# 
# library(lehdr)
# library(dplyr)

## ----usage_basic--------------------------------------------------------------
# or_od <- grab_lodes(
#   state      = "or",
#   year       = 2020,
#   lodes_type = "od",
#   job_type   = "JT01",
#   segment    = "S000",
#   state_part = "main",
#   agg_geo    = "tract"
# )
# 
# head(or_od)

## ----usage_multi--------------------------------------------------------------
# or_ri_od <- grab_lodes(
#   state      = c("or", "ri"),
#   year       = c(2019, 2020),
#   lodes_type = "od",
#   job_type   = "JT01",
#   segment    = "S000",
#   state_part = "main",
#   agg_geo    = "tract"
# )
# 
# head(or_ri_od)

## ----usage_agg----------------------------------------------------------------
# md_rac_county <- grab_lodes(
#   state      = "md",
#   year       = 2019,
#   lodes_type = "rac",
#   job_type   = "JT01",
#   segment    = "S000",
#   agg_geo    = "county"
# )
# 
# head(md_rac_county)

## ----usage_geometry-----------------------------------------------------------
# md_wac_sf <- grab_lodes(
#   state      = "md",
#   year       = 2019,
#   lodes_type = "wac",
#   job_type   = "JT01",
#   segment    = "S000",
#   agg_geo    = "county",
#   geometry   = TRUE
# )
# 
# plot(md_wac_sf["C000"])

## ----usage_xwalk--------------------------------------------------------------
# vt_xwalk <- grab_crosswalk("vt")
# 
# # LODES7 vintage crosswalk (2010 Census blocks)
# vt_xwalk_7 <- grab_crosswalk("vt", version = "LODES7")

## ----commute_stats------------------------------------------------------------
# od_md <- grab_lodes(
#   state      = "md",
#   year       = 2019,
#   lodes_type = "od",
#   job_type   = "JT00",
#   segment    = "S000",
#   state_part = "main",
#   agg_geo    = "county"
# )
# 
# commute_md <- compute_commute_stats(od_md, agg_geo = "county")
# 
# # Most self-contained counties
# commute_md %>%
#   arrange(desc(self_containment)) %>%
#   select(county, workers_in, workers_out, net_flow, self_containment) %>%
#   head(10)

## ----fig1, eval=FALSE, echo=TRUE----------------------------------------------
# # See data-raw/render_vignette_figures.R for the full figure code.
# # Requires: ggplot2, sf, tigris, scales

## ----fig1-display, echo=FALSE, eval=TRUE--------------------------------------
knitr::include_graphics("figures/fig1_balt_self_containment.png")

## ----lodes_change-------------------------------------------------------------
# wac_md_panel <- grab_lodes(
#   state      = "md",
#   year       = c(2010, 2019),
#   lodes_type = "wac",
#   job_type   = "JT00",
#   segment    = "S000",
#   agg_geo    = "county"
# )
# 
# change_md <- compute_lodes_change(
#   wac_md_panel,
#   geo_col      = "w_county",
#   base_year    = 2010,
#   compare_year = 2019,
#   variables    = c("C000", "CE01", "CE02", "CE03")
# )
# 
# # Counties with the largest absolute job growth
# change_md %>%
#   arrange(desc(C000_change)) %>%
#   select(w_county, C000_base, C000_compare, C000_change, C000_pct_change) %>%
#   head(10)

## ----fig2, eval=FALSE, echo=TRUE----------------------------------------------
# # See data-raw/render_vignette_figures.R for the full figure code.
# # Requires: ggplot2, sf, tigris, scales

## ----fig2-display, echo=FALSE, eval=TRUE--------------------------------------
knitr::include_graphics("figures/fig2_md_job_change.png")

## ----lodes_change_long--------------------------------------------------------
# change_long <- compute_lodes_change(
#   wac_md_panel,
#   geo_col   = "w_county",
#   output    = "long",
#   variables = c("CE01", "CE02", "CE03")
# )
# 
# # Suitable for use with ggplot2 facets or grouped geom_col()
# head(change_long)

## ----earnings_share-----------------------------------------------------------
# wac_md <- grab_lodes(
#   state      = "md",
#   year       = 2019,
#   lodes_type = "wac",
#   job_type   = "JT00",
#   segment    = "S000",
#   agg_geo    = "county"
# )
# 
# earn_shares <- compute_earnings_share(wac_md, type = "wac", geo_col = "w_county")
# 
# # Counties with the highest share of low-wage jobs
# earn_shares %>%
#   arrange(desc(share_low)) %>%
#   select(w_county, share_low, share_mid, share_high) %>%
#   head(10)

## ----earnings_share_long------------------------------------------------------
# earn_long <- compute_earnings_share(
#   wac_md,
#   type    = "wac",
#   geo_col = "w_county",
#   output  = "long"
# )
# 
# head(earn_long)

## ----fig3, eval=FALSE, echo=TRUE----------------------------------------------
# # See data-raw/render_vignette_figures.R for the full figure code.
# # Requires: ggplot2, tigris, scales

## ----fig3-display, echo=FALSE, eval=TRUE--------------------------------------
knitr::include_graphics("figures/fig3_md_earnings_shares.png")

## ----earnings_share_change----------------------------------------------------
# wac_panel <- grab_lodes(
#   state      = "md",
#   year       = c(2010, 2019),
#   lodes_type = "wac",
#   job_type   = "JT00",
#   segment    = "S000",
#   agg_geo    = "county"
# )
# 
# share_2010 <- compute_earnings_share(
#   dplyr::filter(wac_panel, year == 2010),
#   type = "wac", geo_col = "w_county"
# )
# 
# share_2019 <- compute_earnings_share(
#   dplyr::filter(wac_panel, year == 2019),
#   type = "wac", geo_col = "w_county"
# )

## ----accessibility------------------------------------------------------------
# od_md <- grab_lodes(
#   state      = "md",
#   year       = 2019,
#   lodes_type = "od",
#   job_type   = "JT00",
#   segment    = "S000",
#   state_part = "main",
#   agg_geo    = "tract"
# )
# 
# accessibility <- od_md %>%
#   dplyr::filter(startsWith(h_tract, "24510")) %>%
#   dplyr::group_by(h_tract) %>%
#   dplyr::summarise(
#     n_dest          = dplyr::n_distinct(w_tract),
#     total_reachable = sum(S000, na.rm = TRUE),
#     .groups         = "drop"
#   )
# 
# head(accessibility)

## ----fig4, eval=FALSE, echo=TRUE----------------------------------------------
# # See data-raw/render_vignette_figures.R for the full figure code.
# # Requires: ggplot2, sf, tigris, scales

## ----fig4-display, echo=FALSE, eval=TRUE--------------------------------------
knitr::include_graphics("figures/fig4_balt_accessibility.png")

## ----caching------------------------------------------------------------------
# options(lehdr_use_cache = TRUE)

## ----cache-clear--------------------------------------------------------------
# cache_dir <- tools::R_user_dir("lehdr", "cache")
# list.files(cache_dir)          # inspect before deleting
# unlink(cache_dir, recursive = TRUE)

