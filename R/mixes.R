# get all mix urls listed on a category page
extract_mixes <- function(page) {

  rvest::html_nodes(page, "#catMixesList a") %>%
    rvest::html_attr("href")
}

#' Get all mix entries listed under a sub-category
#'
#' @param url URL of a sub-category home page
#'
#' @return character vector
#' @export
#'
#' @examples
#' \dontrun{
#' get_mix_entries(url = "https://www.mixesdb.com/w/Category:FACT_Mix")
#' get_mix_entries(url = "https://www.mixesdb.com/w/Category:fabric")
#' get_mix_entries(url = "https://www.mixesdb.com/w/Category:Ben_UFO")
#' }
get_mix_entries <- function(url) {

  page <- url

  mixes <- list()

  while(!is.null(page)) {

    page_html <- xml2::read_html(page)

    mixes <- purrr::list_merge(mixes, extract_mixes(page_html))

    page <- get_next_page(page_html)

  }

  mix_urls <- paste0("https://www.mixesdb.com", unlist(mixes))

  purrr::map(mix_urls, get_mix_meta)



}

get_mix_meta <- function(url){

  page <- url
  page_html <- xml2::read_html(page)


  date_regex <- "\\d{4}-(?:0?[1-9]|1[012])-(?:0?[1-9]|[12][0-9]|3[01])*"

  mix_meta <- list()


  mix_title <- page_html %>%
    extract_mix_title() %>%
    stringr::str_replace_all("@", "-")


  mix_meta[["date"]] <- anytime::anydate(str_extract(mix_title, date_regex))

  mix_meta[["url"]] <- page

  mix_title_date_excl <- stringr::str_remove(mix_title, date_regex) %>%
    str_replace("-", "") %>%
    str_trim()

  mix_meta[["title"]] <- mix_title_date_excl

  mix_title_split <- mix_title_date_excl %>%
      str_split("-") %>%
    unlist()

  mix_meta[["artists"]] <- stringr::str_trim(mix_title_split[1])
  mix_meta[["platform"]] <- stringr::str_trim(mix_title_split[2])

  return(mix_meta)

}

get_mix_entries_tidy <- function(url){



}

