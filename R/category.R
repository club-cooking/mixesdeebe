# get all category urls listed on  page
extract_category_url <- function(page) {

  html_nodes(page, css = "#catSubcatsList a") %>%
    html_attr("href")
}

#' Get all sub-category entries listed on a category page
#'
#' @param home_page home page URL of a category
#'
#' @return character vector
#' @export
#'
#' @examples
#' get_subcat_entries(home_page = "https://www.mixesdb.com/w/MixesDB:Regular_categories")
#' get_subcat_entries(home_page = "https://www.mixesdb.com/w/Category:Venue")
get_subcat_entries <- function(home_page) {

  page <- home_page

  categories <- list()

  while(!is.null(page)) {

    page_html <- read_html(page)

    categories <- list_merge(categories, extract_category_url(page_html))

    page <- get_next_page(page_html)

  }

  unlist(categories)

}

# get all mix urls listed on a category page
extract_mixes <- function(page) {

  html_nodes(page, "#catMixesList a") %>%
    html_attr("href")
}

#' Get all mix entries listed under a sub-category
#'
#' @param home_page home page URL of a sub-category
#'
#' @return character vector
#' @export
#'
#' @examples
#' get_mix_entries(home_page = "https://www.mixesdb.com/w/Category:FACT_Mix")
#' get_mix_entries(home_page = "https://www.mixesdb.com/w/Category:fabric")
#' get_mix_entries(home_page = "https://www.mixesdb.com/w/Category:Ben_UFO")
get_mix_entries <- function(home_page) {

  page <- home_page

  mixes <- list()

  while(!is.null(page)) {

    page_html <- read_html(page)

    mixes <- list_merge(mixes, extract_mixes(page_html))

    page <- get_next_page(page_html)

  }

  unlist(mixes)

}
