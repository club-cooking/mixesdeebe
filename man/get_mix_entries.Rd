% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mixes.R
\name{get_mix_entries}
\alias{get_mix_entries}
\title{Get all mix entries listed under a sub-category}
\usage{
get_mix_entries(url)
}
\arguments{
\item{url}{URL of a sub-category home page}
}
\value{
character vector
}
\description{
Get all mix entries listed under a sub-category
}
\examples{
\dontrun{
get_mix_entries(url = "https://www.mixesdb.com/w/Category:FACT_Mix")
get_mix_entries(url = "https://www.mixesdb.com/w/Category:fabric")
get_mix_entries(url = "https://www.mixesdb.com/w/Category:Ben_UFO")
}
}
