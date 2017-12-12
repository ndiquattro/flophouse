library(rvest)
library(dplyr)

# Get Episode Table
wiki_url <- 'http://flophousepodcast.wikia.com/wiki/Episode_List'
raw_episodes <- read_html(wiki_url) %>%
  html_node('table') %>%
  html_table()

# Clean Data
wiki_dat <- raw_episodes %>%
  # Rename headers
  rename_all(tolower) %>%
  rename(ep_num = `#`, final_judgement = fj) %>%

  # Prune Data
  select(ep_num, final_judgement, hosts, notes) %>%

  # Expand final judgments
  mutate(final_judgement = recode(final_judgement, SD = 'Split Decision',
                                  BB = 'Bad Bad', GB = 'Good Bad',
                                  KL = 'Kinda Liked', .default = NA_character_),
         scraped_date = lubridate::today()) %>%

  # Filter out donor/non-cannon shows
  filter(!is.na(ep_num))

# Write Files
readr::write_csv(wiki_dat, "data-raw/wiki.csv")
save(wiki_dat, file = "data/wiki.rda")
