tracklist_ex <- get_tracklist(
  url = "https://www.mixesdb.com/w/2011-08-23_-_Objekt_@_Boiler_Room_Berlin_001"
  )

tidy_tracklist_ex <- get_tracklist_tidy(
  url = "https://www.mixesdb.com/w/2011-08-23_-_Objekt_@_Boiler_Room_Berlin_001"
)

test_that("get_tracklist returns a list", {
  expect_type(tracklist_ex, "list")
})

test_that("get_tracklist returns a data frame", {
  expect_s3_class(tidy_tracklist_ex, "data.frame")
})
