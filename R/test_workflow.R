#Test traclist pipeline scripts - Idealle we want top be able to take the
#Cateogry page links (read_category_urls) pass the link to read_category_entries
#Pass resulting entry link to read_tracklist for the tracklist.

source("R/category.R")
source("R/tracklist.R")

library(rvest)
library(tidyverse)
library(purrr)
library(stringr)


extract_chart_entries <- function(page){
  html_nodes(page, "div.dplCatTable > ul a") %>%
    html_attr("href")
}

extract_chart_entries(page)

read_category_entries <- function(home_page) {

  home_page_html <- read_html(home_page)

  is_charts <- str_detect(home_page, pattern = "Charts") #Chart pages have neeky url

  n_pages <- count_entries(home_page_html) %>%
    assert_pages()

  if(is_empty(n_pages) == T){
    n_pages <- count_category_entries(home_page_html) %>%
      assert_pages()
  } else {
    n_pages <- n_pages

  }


  pages <- list(home_page)
  mixes <- list()




  for (i in 1:(n_pages)) {
    page <- read_html(pages[[i]])

    if (isTRUE(is_charts)) {

      mixes[[i]] <- extract_chart_entries(page)
    } else{
    mixes[[i]] <- extract_entries(page)
    }
    if (length(pages) == n_pages) {
      unlist(mixes)
    } else {

      if (i == 1) {
        #next_page <- html_nodes(page, "#catcount a")[1]
        if (isTRUE(is_charts)){
          next_page <- html_nodes(page, "span.plainlinks a")[1] #Chart pages seemed to work for this, you might find better html tho
        } else{
          next_page <- html_nodes(page, "#catcount a")[1]
        }

      } else {
        #next_page <- html_nodes(page, "#catcount a")[2]
        if (isTRUE(is_charts)){
          next_page <- html_nodes(page, "span.plainlinks a")[2]
        } else{
          next_page <- html_nodes(page, "#catcount a")[2]
        }
      }

      if(str_detect(html_attr(next_page, "href"), pattern = "www.mixesdb") ==  T) {

        pages[[i+1]] <- paste0("https:", html_attr(next_page, "href"))
      } else{

      pages[[i+1]] <- paste0("https://www.mixesdb.com", html_attr(next_page, "href"))
      #^This works for majority of mixes, but some of the categories i.e beatport
      #when i take the node already had //www.mixesdb.com/ in there, so i changed it.
      }

    }

  }
  urls_from_entries <- unlist(mixes)
  urls_from_entries <- glue::glue("https://www.mixesdb.com{urls_from_entries}")


}



#Essential mix = regular [100]
#Beat port = regular[23]
single_category <- read_category_entries(regular[23])

regular = read_category_urls("https://www.mixesdb.com/w/MixesDB:Regular_categories",
                             category_type = "")


# read_category_entries_safely <- safely(read_category_entries, otherwise = NA_real_)
# category_entries_new <- map(regular, read_category_entries_safely)

category_entries  <- map(regular, read_category_entries)
category_results = transpose(category_entries)[["result"]]
errors <- which(is.na(category_results))

regular_categories_results <- unlist(category_entries)

tracklist_for_regular_category <- map_dfr(regular_categories_results[1], read_tracklist)

read_regular_tracklists_safely <- safely(read_tracklist, otherwise = NA_real_)
tracklist_for_regular_category <- map_dfr(regular_categories_results, read_regular_tracklists_safely)

future::plan(multiprocess)
regular_categories <- future_map(regular_categories_results[1:2],
                                      read_regular_tracklists_safely,
                                      .progress = T)
regular_categories <- map(regular_entries, read_category_entries)
