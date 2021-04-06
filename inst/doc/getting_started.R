## ----install, echo=F, message=FALSE, warning=FALSE----------------------------
## Ref: https://vbaliga.github.io/verify-that-r-packages-are-installed-and-loaded/
## First specify the packages of interest
packages = c("devtools", "dplyr", "stringr")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      #library(x, character.only = TRUE)
    }
  }
)

## ---- message=FALSE, warning=FALSE--------------------------------------------
devtools::install_github("jamgreen/lehdr")
library(lehdr)
library(dplyr)
library(stringr)

## ----usage 1------------------------------------------------------------------

or_od <- grab_lodes(state = "or", year = 2014, lodes_type = "od", job_type = "JT01", 
           segment = "S000", state_part = "main", agg_geo = "tract")

head(or_od)

## ----usage2-------------------------------------------------------------------
or_ri_od <- grab_lodes(state = c("or", "ri"), year = c(2013, 2014), lodes_type = "od", job_type = "JT01", 
           segment = "S000", state_part = "main", agg_geo = "tract")     

head(or_ri_od)

## ----example_county_var-------------------------------------------------------
md_rac <- grab_lodes(state = "md", year = 2015, lodes_type = "wac", job_type = "JT01", segment = "S000")

head(md_rac)

md_rac_county <- md_rac %>% mutate(w_county_fips = str_sub(w_geocode, 1, 5))

head(md_rac_county)

## ----example_county_agg-------------------------------------------------------
md_rac_county <- md_rac %>% mutate(w_county_fips = str_sub(w_geocode, 1, 5)) %>% 
  select(-"w_geocode") %>%
  group_by(w_county_fips, state, year, createdate) %>% 
  summarise_if(is.numeric, sum)

head(md_rac_county)

## ----example_county_agg2------------------------------------------------------
md_rac_county <- grab_lodes(state = "md", year = 2015, lodes_type = "rac", job_type = "JT01", 
           segment = "S000", agg_geo = "county")
           
head(md_rac_county)

## ----example_county_agg3------------------------------------------------------
md_od_county <- grab_lodes(state = "md", year = 2015, lodes_type = "od", job_type = "JT01", 
           segment = "S000", agg_geo = "county", state_part = "main")
           
head(md_od_county)

## ----example_agg_other--------------------------------------------------------
md_rac_bg <- grab_lodes(state = "md", year = 2015, lodes_type = "rac", job_type = "JT01", 
           segment = "S000", agg_geo = "bg")
           
head(md_rac_bg)

md_rac_tract <- grab_lodes(state = "md", year = 2015, lodes_type = "rac", job_type = "JT01", 
           segment = "S000", agg_geo = "tract")
           
head(md_rac_tract)

md_rac_state <- grab_lodes(state = "md", year = 2015, lodes_type = "rac", job_type = "JT01", 
           segment = "S000", agg_geo = "state")
           
head(md_rac_state)

