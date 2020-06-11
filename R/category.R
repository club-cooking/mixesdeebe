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


#' Get all page URLs belonging to a Category entry
#'
#' @param home_page landing page url of a Category
#'
#' @return character vector
#' @export
#'
#' @examples
#' extract_category_pages("https://www.mixesdb.com/w/Category:Essential_Mix")
extract_category_pages <- function(home_page) {

  home_page_html <- read_html(home_page)

  n_pages <- count_entries(home_page_html) %>%
    assert_pages()

  pages <- list(home_page)

  for (i in 1:(n_pages-1)) {
    page <- read_html(pages[[i]]) %>%
      html_nodes("#catcount a")

    if (i == 1) {
      next_page <- page[1]
    } else {
      next_page <- page[2]
    }

    pages[[i+1]] <- paste0("https://www.mixesdb.com", html_attr(next_page, "href"))
  }
  unlist(pages)

}
