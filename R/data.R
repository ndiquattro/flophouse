#' Feed Data
#'
#' Episode information taken from the podcast RSS feed.
#'
#' @source \url{http://theflophouse.libsyn.com/rss}
#' @format A data frame with 10 columns:
#' \describe{
#' \item{ep_num}{Episode number}
#' \item{movie}{Movie title}
#' \item{pub_date}{Day episode was released}
#' \item{pub_datetime}{Date and time episode was released}
#' \item{duration}{Length of episode in minutes}
#' \item{description}{Description of the episode}
#' \item{explicit}{Explicit episode marker}
#' \item{keywords}{Episode keywords}
#' \item{scraped_date}{Date when RSS feed was scraped}
#' \item{full_title}{Original title from RSS feed}
#' }
"feed_dat"

#' Wiki Data
#'
#' Episode list taken from the Flophouse Wiki
#'
#' @source \url{http://flophousepodcast.wikia.com/wiki/Episode_List}
#' @format A data frame with 5 columns:
#' \describe{
#' \item{ep_num}{Episode number}
#' \item{final_judgement}{Summary of final judgements on the movie}
#' \item{hosts}{The hosts of the episode}
#' \item{notes}{Episode notes}
#' \item{scraped_date}{Date when wiki was scraped}
#' }
"wiki_dat"

#' Movie IDs
#'
#' IMDB IDs for each episode
#'
#' @source \url{https://goo.gl/8kNKhM}
#' @format A data frame with 3 columns:
#' \describe{
#' \item{ep_num}{Episode number}
#' \item{imdb_id}{IMDB ID}
#' \item{scraped_date}{Date when wiki was scraped}
#' }
"movies_dat"

#' Recommendations
#'
#' IMDB IDs for recommendations made by the hosts
#'
#' @source \url{http://theflophouserecommends.herokuapp.com/}
#' @format A data frame with 4 columns:
#' \describe{
#' \item{ep_num}{Episode number}
#' \item{host}{Host who made the recommendation}
#' \item{imdb_id}{IMDB ID}
#' \item{scraped_date}{Date when recommendations were scraped}
#' }
"recs_dat"
