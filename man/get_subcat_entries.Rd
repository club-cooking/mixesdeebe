% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/categories.R
\name{get_subcat_entries}
\alias{get_subcat_entries}
\title{Get all sub-category entries listed on a category page}
\usage{
get_subcat_entries(url)
}
\arguments{
\item{url}{URL of a category home page}
}
\value{
character vector
}
\description{
Get all sub-category entries listed on a category page
}
\examples{
\dontrun{
get_subcat_entries(url = "https://www.mixesdb.com/w/MixesDB:Regular_categories")
get_subcat_entries(url = "https://www.mixesdb.com/w/Category:Venue")
}
}
