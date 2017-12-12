library(readr)
library(dplyr)

# Google Sheet
sheet_url <- 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT3CdaagbrMcFTagex4iOEZjWv6ZZ0Ivu8KJ6r89mT9guXEcii5pAPFHsWMgw0xtGo8QCIvgwm5MvPF/pub?output=csv'
gsheet <- read_csv(sheet_url)

# Prune Data
movies_dat <- gsheet %>%
  select(ep_num, imdb_id) %>%
  mutate(scraped_date = lubridate::today())

# Write Files
write_csv(movies_dat, "data-raw/movies.csv")
save(movies_dat, file = "data/movies.rda")
