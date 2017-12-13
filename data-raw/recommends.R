library(readr)
library(tidyr)
library(dplyr)

# Get list
raw_url <- 'https://raw.githubusercontent.com/IanWhitney/flophouse_recommends/master/test/csv/data.csv'
raw_recs <- read_csv(raw_url)

# Clean Data
recs_dat <- raw_recs %>%
  # Make data tidy
  gather(host, imdb_id, -episode) %>%

  # Rename headers and remove hosts with missing data
  rename(ep_num = episode) %>%
  filter(!is.na(imdb_id)) %>%

  # Make host names presentable
  mutate(host = str_replace(host, '_', ' ') %>% str_to_title(),
         host = if_else(str_detect(host, 'Dan Mccoy'), 'Dan McCoy', host),
         scraped_date = lubridate::today()) %>%

  # Order
  arrange(desc(ep_num))

# Write Files
write_csv(recs_dat, "data-raw/recommends.csv")
save(recs_dat, file = "data/recommends.rda")
