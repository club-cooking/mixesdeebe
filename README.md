
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
#> Warning: replacing previous import 'purrr::pluck' by 'rvest::pluck' when loading
#> 'mixesdeebe'
```

Get the track-list for a listed mix as a list object…

``` r
get_tracklist("https://www.mixesdb.com/w/2020-06-15_-_Kush_Jones_-_Resident_Advisor_(RA.732)")
#> $tracklist
#> $tracklist[[1]]
#> $tracklist[[1]]$order
#> [1] 1
#> 
#> $tracklist[[1]]$timestamp
#> [1] NA
#> 
#> $tracklist[[1]]$artist
#> [1] NA
#> 
#> $tracklist[[1]]$track
#> [1] "Be Of It"
#> 
#> $tracklist[[1]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[2]]
#> $tracklist[[2]]$order
#> [1] 2
#> 
#> $tracklist[[2]]$timestamp
#> [1] NA
#> 
#> $tracklist[[2]]$artist
#> [1] NA
#> 
#> $tracklist[[2]]$track
#> [1] "Hot Potato"
#> 
#> $tracklist[[2]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[3]]
#> $tracklist[[3]]$order
#> [1] 3
#> 
#> $tracklist[[3]]$timestamp
#> [1] NA
#> 
#> $tracklist[[3]]$artist
#> [1] NA
#> 
#> $tracklist[[3]]$track
#> [1] "Is It Possible"
#> 
#> $tracklist[[3]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[4]]
#> $tracklist[[4]]$order
#> [1] 4
#> 
#> $tracklist[[4]]$timestamp
#> [1] NA
#> 
#> $tracklist[[4]]$artist
#> [1] NA
#> 
#> $tracklist[[4]]$track
#> [1] "Juke Bounce Werk"
#> 
#> $tracklist[[4]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[5]]
#> $tracklist[[5]]$order
#> [1] 5
#> 
#> $tracklist[[5]]$timestamp
#> [1] NA
#> 
#> $tracklist[[5]]$artist
#> [1] NA
#> 
#> $tracklist[[5]]$track
#> [1] "Strictly"
#> 
#> $tracklist[[5]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[6]]
#> $tracklist[[6]]$order
#> [1] 6
#> 
#> $tracklist[[6]]$timestamp
#> [1] NA
#> 
#> $tracklist[[6]]$artist
#> [1] NA
#> 
#> $tracklist[[6]]$track
#> [1] "Jerry's Funk (Kush Jones Remix)"
#> 
#> $tracklist[[6]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[7]]
#> $tracklist[[7]]$order
#> [1] 7
#> 
#> $tracklist[[7]]$timestamp
#> [1] NA
#> 
#> $tracklist[[7]]$artist
#> [1] NA
#> 
#> $tracklist[[7]]$track
#> [1] "Fuck You"
#> 
#> $tracklist[[7]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[8]]
#> $tracklist[[8]]$order
#> [1] 8
#> 
#> $tracklist[[8]]$timestamp
#> [1] NA
#> 
#> $tracklist[[8]]$artist
#> [1] NA
#> 
#> $tracklist[[8]]$track
#> [1] "Jiggiest"
#> 
#> $tracklist[[8]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[9]]
#> $tracklist[[9]]$order
#> [1] 9
#> 
#> $tracklist[[9]]$timestamp
#> [1] NA
#> 
#> $tracklist[[9]]$artist
#> [1] NA
#> 
#> $tracklist[[9]]$track
#> [1] "Acidic"
#> 
#> $tracklist[[9]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[10]]
#> $tracklist[[10]]$order
#> [1] 10
#> 
#> $tracklist[[10]]$timestamp
#> [1] NA
#> 
#> $tracklist[[10]]$artist
#> [1] NA
#> 
#> $tracklist[[10]]$track
#> [1] "Only One (Tell Me)"
#> 
#> $tracklist[[10]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[11]]
#> $tracklist[[11]]$order
#> [1] 11
#> 
#> $tracklist[[11]]$timestamp
#> [1] NA
#> 
#> $tracklist[[11]]$artist
#> [1] NA
#> 
#> $tracklist[[11]]$track
#> [1] "Spinning My Headass Back"
#> 
#> $tracklist[[11]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[12]]
#> $tracklist[[12]]$order
#> [1] 12
#> 
#> $tracklist[[12]]$timestamp
#> [1] NA
#> 
#> $tracklist[[12]]$artist
#> [1] NA
#> 
#> $tracklist[[12]]$track
#> [1] "Da Real Horn Dem"
#> 
#> $tracklist[[12]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[13]]
#> $tracklist[[13]]$order
#> [1] 13
#> 
#> $tracklist[[13]]$timestamp
#> [1] NA
#> 
#> $tracklist[[13]]$artist
#> [1] NA
#> 
#> $tracklist[[13]]$track
#> [1] "Uno"
#> 
#> $tracklist[[13]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[14]]
#> $tracklist[[14]]$order
#> [1] 14
#> 
#> $tracklist[[14]]$timestamp
#> [1] NA
#> 
#> $tracklist[[14]]$artist
#> [1] NA
#> 
#> $tracklist[[14]]$track
#> [1] "Hope Theo Don't Hear This"
#> 
#> $tracklist[[14]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[15]]
#> $tracklist[[15]]$order
#> [1] 15
#> 
#> $tracklist[[15]]$timestamp
#> [1] NA
#> 
#> $tracklist[[15]]$artist
#> [1] NA
#> 
#> $tracklist[[15]]$track
#> [1] "Wrk Dat Body"
#> 
#> $tracklist[[15]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[16]]
#> $tracklist[[16]]$order
#> [1] 16
#> 
#> $tracklist[[16]]$timestamp
#> [1] NA
#> 
#> $tracklist[[16]]$artist
#> [1] NA
#> 
#> $tracklist[[16]]$track
#> [1] "Do It To Ya"
#> 
#> $tracklist[[16]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[17]]
#> $tracklist[[17]]$order
#> [1] 17
#> 
#> $tracklist[[17]]$timestamp
#> [1] NA
#> 
#> $tracklist[[17]]$artist
#> [1] NA
#> 
#> $tracklist[[17]]$track
#> [1] "The Whistler"
#> 
#> $tracklist[[17]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[18]]
#> $tracklist[[18]]$order
#> [1] 18
#> 
#> $tracklist[[18]]$timestamp
#> [1] NA
#> 
#> $tracklist[[18]]$artist
#> [1] NA
#> 
#> $tracklist[[18]]$track
#> [1] "The Truth About U And I"
#> 
#> $tracklist[[18]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[19]]
#> $tracklist[[19]]$order
#> [1] 19
#> 
#> $tracklist[[19]]$timestamp
#> [1] NA
#> 
#> $tracklist[[19]]$artist
#> [1] NA
#> 
#> $tracklist[[19]]$track
#> [1] "Talk About It"
#> 
#> $tracklist[[19]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[20]]
#> $tracklist[[20]]$order
#> [1] 20
#> 
#> $tracklist[[20]]$timestamp
#> [1] NA
#> 
#> $tracklist[[20]]$artist
#> [1] NA
#> 
#> $tracklist[[20]]$track
#> [1] "U Know What Time It Iz"
#> 
#> $tracklist[[20]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[21]]
#> $tracklist[[21]]$order
#> [1] 21
#> 
#> $tracklist[[21]]$timestamp
#> [1] NA
#> 
#> $tracklist[[21]]$artist
#> [1] NA
#> 
#> $tracklist[[21]]$track
#> [1] "Freeform 160 Keys"
#> 
#> $tracklist[[21]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[22]]
#> $tracklist[[22]]$order
#> [1] 22
#> 
#> $tracklist[[22]]$timestamp
#> [1] NA
#> 
#> $tracklist[[22]]$artist
#> [1] NA
#> 
#> $tracklist[[22]]$track
#> [1] "Wild Wild Get Buck"
#> 
#> $tracklist[[22]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[23]]
#> $tracklist[[23]]$order
#> [1] 23
#> 
#> $tracklist[[23]]$timestamp
#> [1] NA
#> 
#> $tracklist[[23]]$artist
#> [1] NA
#> 
#> $tracklist[[23]]$track
#> [1] "Scratch & Move"
#> 
#> $tracklist[[23]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[24]]
#> $tracklist[[24]]$order
#> [1] 24
#> 
#> $tracklist[[24]]$timestamp
#> [1] NA
#> 
#> $tracklist[[24]]$artist
#> [1] NA
#> 
#> $tracklist[[24]]$track
#> [1] "Red Hot"
#> 
#> $tracklist[[24]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[25]]
#> $tracklist[[25]]$order
#> [1] 25
#> 
#> $tracklist[[25]]$timestamp
#> [1] NA
#> 
#> $tracklist[[25]]$artist
#> [1] NA
#> 
#> $tracklist[[25]]$track
#> [1] "Headassery"
#> 
#> $tracklist[[25]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[26]]
#> $tracklist[[26]]$order
#> [1] 26
#> 
#> $tracklist[[26]]$timestamp
#> [1] NA
#> 
#> $tracklist[[26]]$artist
#> [1] NA
#> 
#> $tracklist[[26]]$track
#> [1] "Neva Fall Like U"
#> 
#> $tracklist[[26]]$label
#> [1] NA
#> 
#> 
#> $tracklist[[27]]
#> $tracklist[[27]]$order
#> [1] 27
#> 
#> $tracklist[[27]]$timestamp
#> [1] NA
#> 
#> $tracklist[[27]]$artist
#> [1] NA
#> 
#> $tracklist[[27]]$track
#> [1] "Ori Space"
#> 
#> $tracklist[[27]]$label
#> [1] NA
#> 
#> 
#> 
#> $title
#> [1] "2020-06-15 - Kush Jones - Resident Advisor (RA.732)"
#> 
#> $url
#> [1] "https://www.mixesdb.com/w/2020-06-15_-_Kush_Jones_-_Resident_Advisor_(RA.732)"
```

…or, in an analysis-friendly tibble.

``` r
get_tracklist_tidy("https://www.mixesdb.com/w/2020-06-15_-_Kush_Jones_-_Resident_Advisor_(RA.732)")
#> # A tibble: 27 x 7
#>    order timestamp artist track       label title           url                 
#>    <int> <chr>     <chr>  <chr>       <chr> <chr>           <chr>               
#>  1     1 <NA>      <NA>   Be Of It    <NA>  2020-06-15 - K… https://www.mixesdb…
#>  2     2 <NA>      <NA>   Hot Potato  <NA>  2020-06-15 - K… https://www.mixesdb…
#>  3     3 <NA>      <NA>   Is It Poss… <NA>  2020-06-15 - K… https://www.mixesdb…
#>  4     4 <NA>      <NA>   Juke Bounc… <NA>  2020-06-15 - K… https://www.mixesdb…
#>  5     5 <NA>      <NA>   Strictly    <NA>  2020-06-15 - K… https://www.mixesdb…
#>  6     6 <NA>      <NA>   Jerry's Fu… <NA>  2020-06-15 - K… https://www.mixesdb…
#>  7     7 <NA>      <NA>   Fuck You    <NA>  2020-06-15 - K… https://www.mixesdb…
#>  8     8 <NA>      <NA>   Jiggiest    <NA>  2020-06-15 - K… https://www.mixesdb…
#>  9     9 <NA>      <NA>   Acidic      <NA>  2020-06-15 - K… https://www.mixesdb…
#> 10    10 <NA>      <NA>   Only One (… <NA>  2020-06-15 - K… https://www.mixesdb…
#> # … with 17 more rows
```

Get all mix pages for a listed “sub-category” (e.g. a “mix series”):

``` r
get_mix_entries("https://www.mixesdb.com/w/Category:Truancy_Volumes")
#>  [1] "https://www.mixesdb.com/w/2010-05-03_-_Nguzunguzu_-_Truancy_Volume_11"               
#>  [2] "https://www.mixesdb.com/w/2011-01-26_-_TWR72_-_Truancy_Volume_22"                    
#>  [3] "https://www.mixesdb.com/w/2011-04-15_-_Guy_Andrews_-_Truancy_Volume_28"              
#>  [4] "https://www.mixesdb.com/w/2011-07-28_-_Helix_-_Truancy_Volume_33"                    
#>  [5] "https://www.mixesdb.com/w/2011-11-16_-_Tessela_-_Truancy_Volume_35"                  
#>  [6] "https://www.mixesdb.com/w/2012-02-15_-_Behling_%26_Simpson_-_Truancy_Volume_40"      
#>  [7] "https://www.mixesdb.com/w/2012-05-31_-_Eclair_Fifi_-_Truancy_Volume_46"              
#>  [8] "https://www.mixesdb.com/w/2012-06-06_-_Ryan_Hemsworth_-_Truancy_Volume_47"           
#>  [9] "https://www.mixesdb.com/w/2012-06-14_-_Anthony_Naples_-_Truancy_Volume_48"           
#> [10] "https://www.mixesdb.com/w/2012-07-05_-_Fold_-_Truancy_Volume_49"                     
#> [11] "https://www.mixesdb.com/w/2012-08-31_-_Timnah_Sommerfeldt_-_Truancy_Volume_50"       
#> [12] "https://www.mixesdb.com/w/2012-09-19_-_Vjuan_Allure_-_Truancy_Volume_51"             
#> [13] "https://www.mixesdb.com/w/2012-09-27_-_Nautiluss_-_Truancy_Volume_52"                
#> [14] "https://www.mixesdb.com/w/2012-10-08_-_Maxmillion_Dunbar_-_Truancy_Volume_53"        
#> [15] "https://www.mixesdb.com/w/2012-11-21_-_Steve_Bicknell_-_Truancy_Volume_57"           
#> [16] "https://www.mixesdb.com/w/2012-12-09_-_Locked_Groove_-_Truancy_Volume_59"            
#> [17] "https://www.mixesdb.com/w/2013-02-02_-_Damu_-_Truancy_Volume_63"                     
#> [18] "https://www.mixesdb.com/w/2013-03-08_-_Dro_Carey_-_Truancy_Volume_67"                
#> [19] "https://www.mixesdb.com/w/2013-06-10_-_Hodge_-_Truancy_Volumes_71"                   
#> [20] "https://www.mixesdb.com/w/2013-09-11_-_Shawn_O%27Sullivan_-_Truancy_Volume_79"       
#> [21] "https://www.mixesdb.com/w/2013-10-16_-_Voiski_-_Truancy_Volume_82"                   
#> [22] "https://www.mixesdb.com/w/2014-04-02_-_Palms_Trax_-_Truancy_Volume_93"               
#> [23] "https://www.mixesdb.com/w/2014-06-04_-_Pariah_-_Truancy_Volume_97"                   
#> [24] "https://www.mixesdb.com/w/2014-06-17_-_Beneath_-_Truancy_Volume_98"                  
#> [25] "https://www.mixesdb.com/w/2014-06-23_-_Beatrice_Dillon_-_Truancy_Volume_99"          
#> [26] "https://www.mixesdb.com/w/2014-09-17_-_Ben_UFO_-_Truancy_Volume_100"                 
#> [27] "https://www.mixesdb.com/w/2014-10-07_-_Deadboy_-_Truancy_Volume_102"                 
#> [28] "https://www.mixesdb.com/w/2014-11-07_-_Big_Strick_-_Truancy_Volume_104"              
#> [29] "https://www.mixesdb.com/w/2015-01-27_-_Krystal_Klear_-_Truancy_Volume_108"           
#> [30] "https://www.mixesdb.com/w/2015-02-04_-_Leif_-_Truancy_Volume_109"                    
#> [31] "https://www.mixesdb.com/w/2015-02-18_-_Braiden_-_Truancy_Volume_110"                 
#> [32] "https://www.mixesdb.com/w/2015-04-07_-_The_Large_-_Truancy_Volume_114"               
#> [33] "https://www.mixesdb.com/w/2015-05-20_-_Kuedo_-_Truancy_Volume_117"                   
#> [34] "https://www.mixesdb.com/w/2015-07-22_-_Volte-Face_-_Truancy_Volume_123"              
#> [35] "https://www.mixesdb.com/w/2015-08-19_-_Jack_Murphy_-_Truancy_Volume_126"             
#> [36] "https://www.mixesdb.com/w/2015-09-10_-_Samrai_%26_Platt_-_Truancy_Volume_127"        
#> [37] "https://www.mixesdb.com/w/2015-11-09_-_A_Made_Up_Sound_-_Truancy_Volume_130"         
#> [38] "https://www.mixesdb.com/w/2016-01-05_-_1432_R_-_Truancy_Volume_135"                  
#> [39] "https://www.mixesdb.com/w/2016-01-14_-_Happa_-_Truancy_Volume_136"                   
#> [40] "https://www.mixesdb.com/w/2016-01-19_-_Kobosil_-_Truancy_Volume_137"                 
#> [41] "https://www.mixesdb.com/w/2016-02-09_-_Moxie_-_Truancy_Volume_138"                   
#> [42] "https://www.mixesdb.com/w/2016-02-17_-_Hi_Tom_-_Truancy_Volume_139"                  
#> [43] "https://www.mixesdb.com/w/2016-03-02_-_Xosar_-_Truancy_Volume_140"                   
#> [44] "https://www.mixesdb.com/w/2016-03-15_-_Sassmouth_-_Truancy_Volume_141"               
#> [45] "https://www.mixesdb.com/w/2016-04-07_-_Minor_Science_-_Truancy_Volume_142"           
#> [46] "https://www.mixesdb.com/w/2016-04-20_-_BNJMN_-_Truancy_Volume_143"                   
#> [47] "https://www.mixesdb.com/w/2016-04-28_-_Tom_Dicicco_-_Truancy_Volume_144"             
#> [48] "https://www.mixesdb.com/w/2016-05-17_-_Tasha_-_Truancy_Volume_145"                   
#> [49] "https://www.mixesdb.com/w/2016-05-25_-_Iglew_-_Truancy_Volume_146"                   
#> [50] "https://www.mixesdb.com/w/2016-06-01_-_Silk_Road_Assassins_-_Truancy_Volume_147"     
#> [51] "https://www.mixesdb.com/w/2016-06-09_-_Peder_Mannerfelt_-_Truancy_Volume_148"        
#> [52] "https://www.mixesdb.com/w/2016-06-30_-_chunyin_-_Truancy_Volume_149"                 
#> [53] "https://www.mixesdb.com/w/2016-07-06_-_Laurel_Halo_-_Truancy_Volume_150"             
#> [54] "https://www.mixesdb.com/w/2016-07-13_-_Resom_-_Truancy_Volume_151"                   
#> [55] "https://www.mixesdb.com/w/2016-07-21_-_Hipsters_Don%27t_Dance_-_Truancy_Volume_152"  
#> [56] "https://www.mixesdb.com/w/2016-08-11_-_8ULENTINA_-_Truancy_Volume_153"               
#> [57] "https://www.mixesdb.com/w/2016-08-18_-_Ploy_-_Truancy_Volume_154"                    
#> [58] "https://www.mixesdb.com/w/2016-09-01_-_SHALT_-_Truancy_Volume_155"                   
#> [59] "https://www.mixesdb.com/w/2016-09-27_-_SVANI_-_Truancy_Volume_156"                   
#> [60] "https://www.mixesdb.com/w/2016-10-06_-_Mr._G_-_Truancy_Volume_157"                   
#> [61] "https://www.mixesdb.com/w/2016-10-13_-_Via_App_-_Truancy_Volume_158"                 
#> [62] "https://www.mixesdb.com/w/2016-10-19_-_Eli_Keszler_-_Truancy_Volume_159"             
#> [63] "https://www.mixesdb.com/w/2016-10-26_-_Steve_Hauschildt_-_Truancy_Volume_160"        
#> [64] "https://www.mixesdb.com/w/2016-11-02_-_Carl_Simon_-_Truancy_Volume_161"              
#> [65] "https://www.mixesdb.com/w/2016-11-10_-_Space_Afrika_-_Truancy_Volume_162"            
#> [66] "https://www.mixesdb.com/w/2016-11-16_-_Valentino_Mora_%26_Amila_-_Truancy_Volume_163"
#> [67] "https://www.mixesdb.com/w/2016-12-01_-_BEARCAT_-_Truancy_Volume_164"                 
#> [68] "https://www.mixesdb.com/w/2016-12-08_-_Spencer_Parker_-_Truancy_Volume_165"          
#> [69] "https://www.mixesdb.com/w/2016-12-19_-_Jules_-_Truancy_Volume_166"                   
#> [70] "https://www.mixesdb.com/w/2017-01-25_-_Tasker_-_Truancy_Volume_167"                  
#> [71] "https://www.mixesdb.com/w/2017-02-09_-_Isabella_-_Truancy_Volume_168"                
#> [72] "https://www.mixesdb.com/w/2017-02-28_-_Apeiron_Crew_-_Truancy_Volume_169"            
#> [73] "https://www.mixesdb.com/w/2017-03-15_-_Dev/Null_-_Truancy_Volume_171"                
#> [74] "https://www.mixesdb.com/w/2017-06-07_-_Jackmaster_-_Truancy_Volume_177,_Pt._1"       
#> [75] "https://www.mixesdb.com/w/2017-06-14_-_Fran%C3%A7ois_X_-_Truancy_Volume_178"         
#> [76] "https://www.mixesdb.com/w/2017-07-25_-_Detroit_In_Effect_-_Truancy_Volume_181"       
#> [77] "https://www.mixesdb.com/w/2017-09-14_-_Roi_Perez_-_Truancy_Volumes_188"              
#> [78] "https://www.mixesdb.com/w/2017-10-13_-_Ivan_Smagghe_-_Truancy_Volume_191"            
#> [79] "https://www.mixesdb.com/w/2017-11-01_-_Joe_-_Truancy_Volumes_193"                    
#> [80] "https://www.mixesdb.com/w/2017-11-15_-_Courtesy_-_Truancy_Volumes_195"               
#> [81] "https://www.mixesdb.com/w/2017-11-22_-_Call_Super_-_Truancy_Volume_196"              
#> [82] "https://www.mixesdb.com/w/2017-11-30_-_Secretsundaze_-_Truancy_Volumes_197"          
#> [83] "https://www.mixesdb.com/w/2017-12-15_-_Shed_-_Truancy_Volumes_199"                   
#> [84] "https://www.mixesdb.com/w/2018-01-17_-_Pearson_Sound_-_Truancy_Volume_200"           
#> [85] "https://www.mixesdb.com/w/2018-02-16_-_Olive_T_-_Truancy_Volume_205"                 
#> [86] "https://www.mixesdb.com/w/2018-02-21_-_Finn_-_Truancy_Volume_206"                    
#> [87] "https://www.mixesdb.com/w/2018-05-24_-_Roza_Terenzi_-_Truancy_Volume_214"            
#> [88] "https://www.mixesdb.com/w/2018-07-16_-_Lucy_-_Truancy_Volume_220"                    
#> [89] "https://www.mixesdb.com/w/2018-08-16_-_Jayda_G_-_Truancy_Volume_222"                 
#> [90] "https://www.mixesdb.com/w/2018-12-14_-_Jasper_James_-_Truancy_Volumes_231"           
#> [91] "https://www.mixesdb.com/w/2019-03-21_-_upsammy_-_Truancy_Volumes_237"                
#> [92] "https://www.mixesdb.com/w/2019-04-10_-_Peter_Van_Hoesen_-_Truancy_Volumes_238"       
#> [93] "https://www.mixesdb.com/w/2019-05-16_-_Batu_-_Truancy_Volume_240"                    
#> [94] "https://www.mixesdb.com/w/2019-09-05_-_Ariel_Zetina_-_Truancy_Volume_249"            
#> [95] "https://www.mixesdb.com/w/2019-10-01_-_Kiernan_Laveaux_-_Truancy_Volume_251"         
#> [96] "https://www.mixesdb.com/w/2019-10-15_-_MoMa_Ready_-_Truancy_Volume_252"              
#> [97] "https://www.mixesdb.com/w/2019-11-14_-_Air_Max_%2797_-_Truancy_Volume_255"
```
