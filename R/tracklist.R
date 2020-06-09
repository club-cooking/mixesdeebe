# get track-list element from a mix page
extract_tracklist <- function(page) {

  html_nodes(page, css = "#Tracklist + ol > li") %>%
    html_text()
}

# split track entry on hyphen
split_track <- function(track) {

  str_split(track, pattern = " - ", 2)
}

# check if track name is included/known
is_track_name_known <- function(split_track) {

  sapply(split_track, function(x) length(x) > 1)
}

# extract timestamp element
pluck_timestamp <- function(split_track) {

  str_extract(
    rvest::pluck(split_track, 1), "(?<=\\[).+?(?=\\])"
  )
}

# extract artist element
pluck_artist <- function(split_track) {

  str_squish(str_split_n(
    rvest::pluck(split_track, 1), "\\]", 2
  ))
}

# extract track name element
pluck_track <- function(split_track) {

  # check which tracks are known
  track_known <- is_track_name_known(split_track)

  map2_chr(track_known, split_track, function(x, y) {

    if (!x) return(NA)
    else return(str_squish(str_split_n(y[2], "\\[", 1)))
  })
}

# extract label element
pluck_label <- function(split_track) {

  # check which tracks are known
  track_known <- is_track_name_known(split_track)

  map2_chr(track_known, split_track, function(x, y) {

    if (!x) return(NA)
    else return(str_squish(str_extract(y[2], "(?<=\\[).+?(?=\\])")))
  })
}

# extract tracklist metadata into a data frame
parse_tracklist <- function(tracklist) {

  # split up entries
  track_info <- split_track(tracklist)

  # extract elements of track metadata, vectorised
  time_stamps <- pluck_timestamp(track_info)
  artists <- pluck_artist(track_info)
  track_names <- pluck_track(track_info)
  labels <- pluck_label(track_info)

  # return as tidy tibble
  tibble(
    timestamp = time_stamps,
    artist = artists,
    track = track_names,
    label = labels
  )

}

#' Read tracklist metadata from a mix entry
#'
#' @param page url of a mix entry
#'
#' @return tibble
#' @export
#'
#' @examples
#' read_tracklist("https://www.mixesdb.com/w/2011-08-23_-_Objekt_@_Boiler_Room_Berlin_001")
read_tracklist <- function(page) {

  read_html(page) %>%
  extract_tracklist() %>%
    parse_tracklist()
}
