% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grab_crosswalk.R
\name{grab_crosswalk}
\alias{grab_crosswalk}
\title{Download and load LODES geographic crosswalk into a data frame (tibble)}
\usage{
grab_crosswalk(
  state,
  download_dir = normalizePath(file.path(tools::R_user_dir("lehdr", which = "cache")),
    mustWork = FALSE)
)
}
\arguments{
\item{state}{US state abbreviation in lower case, can be a vector of states.}

\item{download_dir}{Directory where lodes table will be downloaded.}
}
\value{
a dataframe (tibble) geographic crosswalk at the block level
}
\description{
Download LODES geographic crosswalk
}
\examples{
\donttest{
# Download and load current geographic crosswalk for Alaska
alaska_xwalk <- grab_crosswalk("VT")

# Download and load current geographic crosswalk for small states
small_states_xwalk <- grab_crosswalk(c("wy", 'ND', 'SD'))
}

}
