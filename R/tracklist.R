# get track-list element from a mix page
extract_tracklist <- function(page) {

  tracks <- rvest::html_nodes(page, css = "#Tracklist, #Chart ~ ol > li")

  if (length(tracks) == 0) {
    tracks <- rvest::html_nodes(page, css = "#Tracklist, #Chart ~ div > ol > li")

  }

  rvest::html_text(tracks)

}

# extract mix title
extract_mix_title <- function(page) {

  rvest::html_nodes(page, css = "#firstHeading") %>%
    rvest::html_text()
}

# split track entry on hyphen
split_track <- function(track) {

  stringr::str_split(track, pattern = " - ", 2)
}

# check if track name is included/known
is_track_name_known <- function(split_track) {

  sapply(split_track, function(x) length(x) > 1)
}

# extract timestamp element
pluck_timestamp <- function(split_track) {

  stringr::str_extract(
    rvest::pluck(split_track, 1), "(?<=\\[).+?(?=\\])"
  )
}

# extract artist element
pluck_artist <- function(split_track) {

  stringr::str_squish(
    stringr::str_remove_all(
      rvest::pluck(split_track, 1), "\\s*\\[[^\\)]+\\]"
      )
    )
}

# extract track name element
pluck_track <- function(split_track) {

  # check which tracks are known
  track_known <- is_track_name_known(split_track)

  purrr::map2_chr(track_known, split_track, function(x, y) {

    if (!x) return(NA)
    else return(
      stringr::str_squish(
        stringr::str_remove_all(
          y[2], "\\s*\\[[^\\)]+\\]"
        )
      )
    )
  })
}

# extract label element
pluck_label <- function(split_track) {

  # check which tracks are known
  track_known <- is_track_name_known(split_track)

  purrr::map2_chr(track_known, split_track, function(x, y) {

    if (!x)  {return(NA)}
    else {
        label <- stringr::str_squish(
          stringr::str_extract(
            y[2], "(?<=\\[).+?(?=\\])"
          )
        )

        stringr::str_squish(
          stringr::str_split_n(label, " - ", 1)
        )
    }
  })
}

# extract catalogue no.
pluck_catno <- function(split_track) {

  # check which tracks are known
  track_known <- is_track_name_known(split_track)

  purrr::map2_chr(track_known, split_track, function(x, y) {

    if (!x)  {return(NA)}
    else {
      label <- stringr::str_squish(
        stringr::str_extract(
          y[2], "(?<=\\[).+?(?=\\])"
        )
      )

      stringr::str_squish(
        stringr::str_split_n(label, " - ", 2)
      )
    }
  })
}

# extract tracklist metadata into a data frame
parse_tracklist <- function(tracklist, flatten) {

  # split up entries
  track_info <- split_track(tracklist)

  # extract elements of track metadata, vectorised
  time_stamps <- pluck_timestamp(track_info)
  artists <- pluck_artist(track_info)
  track_names <- pluck_track(track_info)
  labels <- pluck_label(track_info)
  cat_nos <- pluck_catno(track_info)


  if (flatten) {
    tibble::tibble(
      order = 1:length(track_info),
      timestamp = time_stamps,
      artist = artists,
      track = track_names,
      label = labels,
      cat_no = cat_nos
    )
  } else {

    list(
      tracklist = lapply(seq_along(tracklist), function(x) {

        list(
          order = x,
          timestamp = time_stamps[x],
          artist = artists[x],
          track = track_names[x],
          label = labels[x],
          cat_no = cat_nos[x]
        )
      })
    )
  }

}

#' Read tracklist metadata from a mix entry
#'
#' @param url URL of a mix entry
#'
#' @return a list
#' @export
#'
#' @examples
#' \dontrun{
#' get_tracklist(url = "https://www.mixesdb.com/w/2019-03-06_-_Object_Blue_-_The_Selector_After_Dark")
#' get_tracklist(url = "https://www.mixesdb.com/w/2020-06-15_-_Kush_Jones_-_Resident_Advisor_(RA.732)")
#' }
get_tracklist <- function(url) {

  page_html <- xml2::read_html(url)

  tracklist <- extract_tracklist(page_html) %>%
    parse_tracklist(flatten = FALSE)

  tracklist[["title"]] <- extract_mix_title(page_html)
  tracklist[["url"]] <- url

  tracklist
}

#' Get tracklist metadata from a mix entry into a tidy data frame
#'
#' @param url URL of a mix page
#'
#' @return a tibble
#' @export
#'
#' @examples
#' \dontrun{
#' get_tracklist_tidy("https://www.mixesdb.com/w/2011-08-23_-_Objekt_@_Boiler_Room_Berlin_001")
#' }
get_tracklist_tidy <- function(url) {

  page_html <- xml2::read_html(url)

  tracklist <- extract_tracklist(page_html) %>%
    parse_tracklist(flatten = TRUE)

  tracklist[["title"]] <- extract_mix_title(page_html)
  tracklist[["url"]] <- url

  tracklist
}
