
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mixesdeebe

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/mixesdeebe)](https://CRAN.R-project.org/package=mixesdeebe)
<!-- badges: end -->

A web scraper for [MixesDB](https://www.mixesdb.com), written in R.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("club-cooking/mixesdeebe")
```

## Usage

``` r
library(mixesdeebe)
```

Get the tracklist for a mix, as a tidy “tibble”.

``` r
get_tracklist_tidy("https://www.mixesdb.com/w/2020-06-15_-_Kush_Jones_-_Resident_Advisor_(RA.732)")
#> # A tibble: 27 x 8
#>    order timestamp artist   track     label cat_no title        url             
#>    <int> <chr>     <chr>    <chr>     <chr> <chr>  <chr>        <chr>           
#>  1     1 <NA>      RP Boo   Be Of It  <NA>  <NA>   2020-06-15 … https://www.mix…
#>  2     2 <NA>      DJ Love  Hot Pota… <NA>  <NA>   2020-06-15 … https://www.mix…
#>  3     3 <NA>      Kush Jo… Is It Po… <NA>  <NA>   2020-06-15 … https://www.mix…
#>  4     4 <NA>      DJ Clent Juke Bou… <NA>  <NA>   2020-06-15 … https://www.mix…
#>  5     5 <NA>      Cakedog  Strictly  <NA>  <NA>   2020-06-15 … https://www.mix…
#>  6     6 <NA>      Clear P… Jerry's … <NA>  <NA>   2020-06-15 … https://www.mix…
#>  7     7 <NA>      DJ Corey Fuck You  <NA>  <NA>   2020-06-15 … https://www.mix…
#>  8     8 <NA>      Kush Jo… Jiggiest  <NA>  <NA>   2020-06-15 … https://www.mix…
#>  9     9 <NA>      Kush Jo… Acidic    <NA>  <NA>   2020-06-15 … https://www.mix…
#> 10    10 <NA>      RayReck  Only One… <NA>  <NA>   2020-06-15 … https://www.mix…
#> # … with 17 more rows
```

Get all mix pages for a “sub-category” (e.g. a “mix series”):

``` r
truancy_vols <- get_mix_entries("https://www.mixesdb.com/w/Category:Truancy_Volumes")

head(truancy_vols)
#> [1] "https://www.mixesdb.com/w/2010-05-03_-_Nguzunguzu_-_Truancy_Volume_11"         
#> [2] "https://www.mixesdb.com/w/2011-01-26_-_TWR72_-_Truancy_Volume_22"              
#> [3] "https://www.mixesdb.com/w/2011-04-15_-_Guy_Andrews_-_Truancy_Volume_28"        
#> [4] "https://www.mixesdb.com/w/2011-07-28_-_Helix_-_Truancy_Volume_33"              
#> [5] "https://www.mixesdb.com/w/2011-11-16_-_Tessela_-_Truancy_Volume_35"            
#> [6] "https://www.mixesdb.com/w/2012-02-15_-_Behling_%26_Simpson_-_Truancy_Volume_40"
```
