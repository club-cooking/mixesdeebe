devtools::load_all()

library(rvest)
library(tidyverse)
library(purrr)
library(stringr)

regular <- get_subcat_entries(home_page = "https://www.mixesdb.com/w/MixesDB:Regular_categories")
#Essential mix = regular [100]
#Beat port = regular[23]
single_category <- get_mix_entries(regular[100])

podcasts = get_subcat_entries("https://www.mixesdb.com/w/Category:Podcast")

safe_podcast_entries <- safely(get_mix_entries, otherwise = NA_real_)
podcasts_entries  <- map(podcasts, safe_podcast_entries)
podcast_results = transpose(podcasts_entries)[["result"]]
errors <- which(is.na(podcast_results))
podcast_to_extarct <- unlist(podcasts_entries) %>%
  sample( size = 100)

read_tracklist_safe <- safely(read_tracklist, otherwise = NA_real_)
tracklist_for_podcasts <- map(podcast_to_extarct, read_tracklist_safe) %>%
  set_names(podcast_to_extarct)

foo <- flatten_df(tracklist_for_podcasts) %>%
  group_by(title) %>%
  unlist(tracklist)
foo_ = unlist(foo$tracklist)
errors_in_tracklist <- transpose(tracklist_for_podcasts)[["error"]]


# read_category_entries_safely <- safely(read_category_entries, otherwise = NA_real_)
# category_entries_new <- map(regular, read_category_entries_safely)

category_entries  <- map(regular, get_mix_entries)
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
regular_categories <- map(regular_entries, get_mix_entries)
