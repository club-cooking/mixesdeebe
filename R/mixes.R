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

    page_html <- polite_read_html(page)

    mixes <- purrr::list_merge(mixes, extract_mixes(page_html))

    page <- get_next_page(page_html)

  }

  paste0("https://www.mixesdb.com", unlist(mixes))

}

#' Get mix-level metadata
#'
#' @param url URL of a mix page
#'
#' @return list
#' @export
#'
#' @examples
#' \dontrun{
#' mixes <- get_mix_entries(url = "https://www.mixesdb.com/w/Category:FACT_Mix")
#' get_mix_meta(mixes[1:5])
#' }
get_mix_meta <- function(url) {

  purrr::map(url, get_mix_fields)
}

#' Get mix-level metadata into a tidy data frame
#'
#' @param url URL of a mix page
#'
#' @return tibble
#' @export
#'
#' @examples
#' \dontrun{
#' mixes <- get_mix_entries(url = "https://www.mixesdb.com/w/Category:FACT_Mix")
#' get_mix_meta_tidy(mixes[1:5])
#' }
get_mix_meta_tidy <- function(url){

  purrr::map_dfr(url, get_mix_fields)
}

# extract mix-level metadata fields
get_mix_fields <- function(url){

  page <- url
  page_html <- polite_read_html(page)

  tracklist_completed_flag <- rvest::html_nodes(page_html, "#mw-normal-catlinks a") %>%
    rvest::html_attr("href") %>%
    str_subset("Tracklist:") %>%
    str_extract("\\_.*") %>%
    str_replace("_", "")

  date_regex <- "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))"

  mix_meta <- list()

  mix_title <- page_html %>%
    extract_mix_title() %>%
    stringr::str_replace_all("@", "-")

  mix_meta[["date"]] <- anytime::anydate(stringr::str_extract(mix_title, date_regex))

  mix_meta[["url"]] <- page
  mix_meta[["tracklist_complete"]] <- if_else(tracklist_completed_flag == "complete", T,F)

  mix_title_date_excl <- stringr::str_remove(mix_title, date_regex) %>%
    stringr::str_replace("-", "") %>%
    stringr::str_trim()

  mix_meta[["title"]] <- mix_title_date_excl

  mix_title_split <- mix_title_date_excl %>%
    stringr::str_split("-") %>%
    unlist()

  mix_meta[["artists"]] <- stringr::str_trim(mix_title_split[1])
  mix_meta[["platform"]] <- stringr::str_trim(mix_title_split[2])

  return(mix_meta)

}
