# get all category urls listed on  page
extract_category_url <- function(page) {

  rvest::html_nodes(page, css = "#catSubcatsList a") %>%
    rvest::html_attr("href")
}

#' Get all sub-category entries listed on a category page
#'
#' @param url URL of a category home page
#'
#' @return character vector
#' @export
#'
#' @examples
#' \dontrun{
#' get_subcat_entries(url = "https://www.mixesdb.com/w/MixesDB:Regular_categories")
#' get_subcat_entries(url = "https://www.mixesdb.com/w/Category:Venue")
#' }
get_subcat_entries <- function(url) {

  page <- url

  categories <- list()

  while(!is.null(page)) {

    page_html <- polite_read_html(page)

    categories <- purrr::list_merge(categories, extract_category_url(page_html))

    page <- get_next_page(page_html)

  }

  paste0("https://www.mixesdb.com", unlist(categories))

}
