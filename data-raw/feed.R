library(rvest)
library(purrr)
library(dplyr)
library(stringr)
library(lubridate)
library(readr)

# Process the RSS feed
feed_url <- 'http://theflophouse.libsyn.com/rss'
flop_feed <- read_html(feed_url)

# Extract each episode from feed
feed_df <- flop_feed %>%
  html_nodes('item') %>%
  map(html_children) %>%
  map(~html_text(.x) %>% set_names(html_name(.x)) %>% as.list()) %>%
  bind_rows()

# Fix features
feed_dat <- feed_df %>%
  mutate(
    # Fix date
    pub_datetime = dmy_hms(pubdate),
    pub_date = date(pub_datetime),

    # Fix Duration
    duration = ifelse(str_length(duration) < 8, str_c('00:', duration), duration),
    duration = hms(duration) %>% seconds() %>% as.numeric() / 60,
    duration = round(duration),

    # Extract Movie title
    movie = str_extract(title, '(?<=- ).+'),
    movie = if_else(str_detect(movie, 'LIVE'),
                    str_extract(movie, '.+(?= LIVE)'),
                    movie),  # Fix live show titles

    # Extract Episode Number
    ep_num = str_extract(title, '(?<=#)\\d+') %>% as.numeric(),
    ep_num = ifelse(is.na(ep_num),
                    str_extract(title, '(?<=# )\\d+') %>% as.numeric(),
                    ep_num)) %>%

    # Remove Movie Minute Episodes
    filter(!str_detect(title, 'Movie Minute')) %>%

    # Fix the first 10 episode numbers
    mutate(rnumd = seq(n(), 1),
           rnum = row_number(),
           ep_num = ifelse(rnum > nth(rnum, -11), rnumd, ep_num),
           scraped_date = today()) %>%
    select(-rnumd)

# Manual Fixes
feed_dat <- feed_dat %>%
  mutate(
    ep_num = case_when(
      str_detect(title, 'Trespass') ~ 95,
      str_detect(title, 'Gamer') ~ 54,
      str_detect(title, 'Premonition') ~ 19,
      str_detect(title, 'Jumper') ~ 18,
      str_detect(title, 'The Invasion') ~ 13,
      str_detect(title, 'Awake') ~ 12,
      TRUE ~ ep_num
    ),
    duration = case_when(
      str_detect(title, 'Bratz') ~ 57.63,
      str_detect(title, 'Untraceable') ~ 41.35,
      str_detect(title, 'Saw III') ~ 43,
      TRUE ~ duration
    ),
    movie = case_when(
      str_detect(title, 'Old Dogs') ~ 'Old Dogs',
      TRUE ~ movie
    )
  )

# Prune data
feed_dat <- feed_dat %>%
  select(ep_num, movie, pub_date, pub_datetime, duration, description, explicit,
         keywords, scraped_date, title) %>%
  filter(!is.na(ep_num)) %>%
  rename(full_title = title)

# Write Files
write_csv(feed_dat, "data-raw/feed.csv")
save(feed_dat, file = "data/feed.rda")
