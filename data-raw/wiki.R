library(readr)
library(dplyr)

# Google Sheet
gsheet <- 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT3CdaagbrMcFTagex4iOEZjWv6ZZ0Ivu8KJ6r89mT9guXEcii5pAPFHsWMgw0xtGo8QCIvgwm5MvPF/pub?output=csv'

# Read and clean
flopdat <- read_csv(gsheet) %>%
  select(-title) %>%
  mutate(final_judge = na_if(final_judge, '?'),
         scraped_date = today())