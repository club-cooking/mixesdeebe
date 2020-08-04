# isolate pagination controls on mix page
get_page_controls <- function(x) {

  controls <- rvest::html_nodes(x, ".listPagination")

  if (length(controls) == 0) {
    controls <- rvest::html_nodes(x, ".plainlinks")
  }

  rvest::html_nodes(controls, "a")
}

# return url of the next page (or NULL if no next page)
get_next_page <- function(x) {

  page_controls <- get_page_controls(x)

  if (length(page_controls) == 0) return(NULL)

  next_page_link <- page_controls[length(page_controls)]

  next_page_text <- rvest::html_text(next_page_link)

  if (stringr::str_detect(next_page_text, "next")) {

    if (startsWith(rvest::html_attr(next_page_link, "href"), "//")) {

      paste0("https:", rvest::html_attr(next_page_link, "href"))

    } else {

      paste0("https://www.mixesdb.com", rvest::html_attr(next_page_link, "href"))

    }

    } else NULL
}
