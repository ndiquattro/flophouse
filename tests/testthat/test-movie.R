context("test-movie.R")

test_that("movies has latest episode", {
  expect_equal(max(feed_dat$ep_num), max(movies_dat$ep_num))
})
