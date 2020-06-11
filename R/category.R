# get # mix entries in a category
count_entries <- function(home_page) {

  html_nodes(home_page, "div.catCount") %>%
    html_text() %>%
    str_extract("(?<=out of ).*") %>%
    str_remove_all("\\D") %>%
    as.numeric(.)

}

# assert # of category pages from # mix entries
assert_pages <- function(x) {
  ceiling(x / 200)
}

# get all mix urls listed on a category page
extract_entries <- function(page) {

  html_nodes(page, "#catMixesList a") %>%
    html_attr("href")
}


#' Get all mix URLs listed under a Category entry
#'
#' @param home_page landing page url of a Category
#'
#' @return character vector
#' @export
#'
#' @examples
#' read_category_entries("https://www.mixesdb.com/w/Category:Essential_Mix")
read_category_entries <- function(home_page) {

  home_page_html <- read_html(home_page)

  n_pages <- count_entries(home_page_html) %>%
    assert_pages()

  pages <- list(home_page)
  mixes <- list()

  for (i in 1:(n_pages-1)) {
    page <- read_html(pages[[i]])

    mixes[[i]] <- extract_entries(page)

    if (i == 1) {
      next_page <- html_nodes(page, "#catcount a")[1]
    } else {
      next_page <- html_nodes(page, "#catcount a")[2]
    }

    pages[[i+1]] <- paste0("https://www.mixesdb.com", html_attr(next_page, "href"))
  }
  unlist(mixes)

}


