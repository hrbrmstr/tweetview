#' Turn a data frame of `rtweet` tweets into a tweet thread
#'
#' A tweet thread is usually a series of tweets that are in reply to each other
#' from the same author. It may be advantageous to mark a series of tweets as
#' a tweet thread for display purposes.
#'
#' @param x a data frame of `rtweet` tweets
#' @export
as_tweet_thread <- function(x) {

  list(
    tweet_thread = x,
    thread_text = dplyr::pull(x, text) %>% paste0(collapse="\n\n"),
    thread_html = dplyr::rowwise(x) %>%
      dplyr::do(html = htmlify_tweet(.)) %>%
      dplyr::select(html) %>%
      tidyr::unnest(html) %>%
      dplyr::pull(html)
  ) -> out

  class(out) <- c("tweet_thread")

  out

}
