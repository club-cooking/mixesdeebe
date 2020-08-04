# isolate pagination controls on mix page
get_page_controls <- function(x) {

  controls <- html_nodes(x, ".listPagination")

  if (length(controls) == 0) {
    controls <- html_nodes(x, ".plainlinks")
  }

  html_nodes(controls, "a")
}

# return url of the next page (or NULL if no next page)
get_next_page <- function(x) {

  page_controls <- get_page_controls(x)

  if (length(page_controls) == 0) return(NULL)

  next_page_link <- page_controls[length(page_controls)]

  next_page_text <- html_text(next_page_link)

  if (stringr::str_detect(next_page_text, "next")) {

    if (startsWith(html_attr(next_page_link, "href"), "//")) {

      paste0("https:", html_attr(next_page_link, "href"))

    } else {

      paste0("https://www.mixesdb.com", html_attr(next_page_link, "href"))

    }

    } else NULL
}
