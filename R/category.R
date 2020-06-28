# get # mix entries in a category
count_entries <- function(home_page) {

  html_nodes(home_page, "div.catCount") %>%
    html_text() %>%
    str_extract("(?<=out of ).*") %>%
    str_remove_all("\\D") %>%
    as.numeric(.)

}

# The html span object for this page seemed to be null and the of of number was just
# text so couldnt use your function. Possibly ways to combine later.

count_category_entries <- function(category_page_html, categor_type  = "") {

  if (categor_type == "style") {

    html_text(category_page_html) %>%
      str_extract("(?<=out of ).*") %>%
      str_replace("\\).*", "") %>%
      as.numeric(.)
  } else if (categor_type == "show") {

    html_nodes(category_page_html, "#catcount") %>%
      html_text() %>%
      str_extract("(?<=out of ).*") %>%
      str_remove_all("\\D") %>%
      as.numeric(.)
  } else{
  html_text(category_page_html) %>%
    str_extract("(?<=out of ).*") %>%
    str_remove_all("\\D") %>%
    as.numeric(.)
  }

}


# assert # of category pages from # mix entries
assert_pages <- function(x) {
  ceiling(x / 200)
}

# get all category urls listed on  page
extract_category_url <- function(page) {

  html_nodes(page, css = "#catSubcatsList a") %>%
    html_attr("href")
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

  if(is_empty(n_pages) == T){
    n_pages <- count_category_entries(home_page_html) %>%
      assert_pages()
  } else {
    n_pages <- n-pages

  }


  pages <- list(home_page)
  mixes <- list()



  for (i in 1:(n_pages)) {
    page <- read_html(pages[[i]])

    mixes[[i]] <- extract_entries(page)

    if (length(pages) == n_pages) {
      unlist(mixes)
    } else {

    if (i == 1) {
      next_page <- html_nodes(page, "#catcount a")[1]
    } else {
      next_page <- html_nodes(page, "#catcount a")[2]
    }

    pages[[i+1]] <- paste0("https://www.mixesdb.com", html_attr(next_page, "href"))
    }

  }
  urls_from_entries <- unlist(mixes)
  urls_from_entries <- glue::glue("https://www.mixesdb.com{urls_from_entries}")


}


#' Get all category urls
#'
#' @param category_page category url homepafe
#'
#' @return character vector
#' @export
#'
#' @examples
#' read_category_urls("https://www.mixesdb.com/db/index.php?title=MixesDB:Regular_categories&mode=&cat=&style=&cyonly=&tlN=&format=&offset=0")
read_category_urls <- function(category_page, category_type  = "") {

  category_page_html <- read_html(category_page)

  n_pages <- count_category_entries(category_page_html, categor_type = category_type) %>%
    assert_pages()

  pages <- list(category_page)
  mixes <- list()


  for (i in 1:(n_pages)) {
    page <- read_html(pages[[i]])

    mixes[[i]] <- extract_category_url(page)

    if(category_type == "regular") {

      if (length(pages) == n_pages) {
        unlist(mixes)
      } else {

        if (i == 1){
          next_page <- html_nodes(category_page_html, "span.plainlinks a")[1]
        } else {
          next_page <- html_nodes(category_page_html, "span.plainlinks a")[2]
        }

        pages[[i+1]] <- paste0("https:", html_attr(next_page, "href"))

      }
    } else
      if (length(pages) == n_pages) {
        unlist(mixes)
      } else {

        if (i == 1) {
          next_page <- html_nodes(page, "div.listPagination a")[1]
        } else {
          next_page <- html_nodes(page, "div.listPagination a")[2]
        }
        pages[[i+1]] <- paste0("https://www.mixesdb.com", html_attr(next_page, "href"))

      }

  } #End loop bracket

  urls_from_category<- unlist(mixes)

  urls_from_category <- glue::glue("https://www.mixesdb.com{urls_from_category}")

} #func bracket
