#Test traclist pipeline scripts - Idealle we want top be able to take the
#Cateogry page links (read_category_urls) pass the link to read_category_entries
#Pass resulting entry link to read_tracklist for the tracklist.

source("R/category.R")
source("R/tracklist.R")

library(rvest)
library(tidyverse)
library(purrr)
library(stringr)

regular = read_category_urls("https://www.mixesdb.com/w/MixesDB:Regular_categories",
                             category_type = "")


read_category_entries_safely <- safely(read_category_entries, otherwise = NA_real_)

category_entries  <- map(regular, read_category_entries)

category_entries_new <- map(regular, read_category_entries_safely)

categor_results = transpose(category_entries_new)[["result"]]
errors <- which(is.na(categor_results))


extract_chart_entries <- function(page){
  html_nodes(page, "div.dplCatTable > ul a") %>%
    html_attr("href")
}

extract_chart_entries(page)

read_category_entries <- function(home_page) {

  home_page_html <- read_html(home_page)

  is_charts <- str_detect(home_page, pattern = "Charts")

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
         next_page <- when(is_charts == T ~
                             html_nodes(page, "span.plainlinks a")[1], ~
                             html_nodes(page, "#catcount a")[1])
      } else {
        #next_page <- html_nodes(page, "#catcount a")[2]
         next_page <- when(is_charts == T ~
                             html_nodes(page, "span.plainlinks a")[2], ~
                             html_nodes(page, "#catcount a")[2])
      }

      pages[[i+1]] <- paste0("https://www.mixesdb.com", html_attr(next_page, "href"))
    }

  }
  urls_from_entries <- unlist(mixes)
  urls_from_entries <- glue::glue("https://www.mixesdb.com{urls_from_entries}")


}




single_category <- read_category_entries(regular[1])

test <- read_tracklist(paste0("https://www.mixesdb.com", foo[1]))

map_dfr(regular_entries, read_tracklist)

foo = unlist(l
foo


map(regular_entries[1:2], read_category_entries)
