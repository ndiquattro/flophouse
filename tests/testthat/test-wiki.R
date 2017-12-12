context("test-wiki.R")

test_that("wiki has latest episode", {
  expect_equal(max(feed_dat$ep_num), max(wiki_dat$ep_num))
})
