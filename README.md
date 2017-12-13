# flophouse

This is a R data package that provides information about the bad news podcast named [The Flophouse](https://www.flophousepodcast.com/). Data includes IMDB IDs for each movie featured and recommended, final judgments of the movie by the hosts, and episode duration.

## Installation

You can install flophouse from github with:


``` r
# install.packages("devtools")
devtools::install_github("ndiquattro/flophouse")
```

## Documentation

Each dataframe is documented which you can view with the `?` function.
``` r
?feed_dat
```
## Data Summary

Here are the datasets provided:

1. feed_dat - Data from the official RSS Feed
2. wiki_dat - Data from the flophouse fan wiki
3. movies_dat - IMDB IDs of featured movies
4. recs_dat - IMDB IDs of movies reccomended by the hosts.

## Data Sources
`wiki_dat` comes from [the flophouse fan wikia](http://flophousepodcast.wikia.com/wiki/The_Flop_House_Wiki)

`recs_dat` comes from the [website](http://theflophouserecommends.herokuapp.com/)  [flophouse_recommends](https://github.com/IanWhitney/flophouse_recommends) 