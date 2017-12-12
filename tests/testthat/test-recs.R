context("test-recs.R")

test_that("recommendations have latest episode", {
  expect_equal(max(feed_dat$ep_num), max(recs_dat$ep_num))
})
