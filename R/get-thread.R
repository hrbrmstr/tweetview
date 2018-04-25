#' Retrieve an authors tweet thread/rant from a starting status id
#'
#' @param first_status the first status id in the tweet thread
#' @param .timeline_history how much timeline history of the tweet author
#'        to pull to use when searching for the thread?
#' @return `list` with a data frame of the tweets and a text representation of the
#'         thread.
#' @export
#' @examples \dontrun{
#' thrd <- get_thread("988895496381984770")
#'
#' thrd
#' }
get_thread <- function(first_status, .timeline_history=3000) {

  # get first status
  orig <- rtweet::lookup_tweets(first_status)

  # grab the author's timeline to search
  author_timeline <- rtweet::get_timeline(orig$screen_name, n=.timeline_history)

  # build a data frame containing from/to pairs (anything the author
  # replied to) that also includes the `first_status` id.
  suppressWarnings(
    dplyr::filter(author_timeline,
                  (status_id == first_status) |
                    (reply_to_screen_name == orig$screen_name)) %>%
      dplyr::select(status_id, reply_to_status_id) %>%
      igraph::graph_from_data_frame() -> g
  ) # build a graph from thiss

  # decompose the graph into unique subgraphs and return them to data frames
  igraph::decompose(g) %>%
    purrr::map(igraph::as_data_frame) -> threads_dfs

  # find the thread with our `first_status` ids
  thread_df <- purrr::keep(threads_dfs, ~any(which(unique(unlist(.x, use.names=FALSE)) == first_status)))

  # BONUS: we get them in the order we need!
  thread_order <- purrr::discard(rev(unique(unlist(thread_df))), stri_detect_fixed, "NA")

  # filter out the thread from the timeline corpus & sort it
  dplyr::filter(author_timeline, status_id %in% pull(thread_df[[1]], from)) %>%
    dplyr::mutate(status_id = factor(status_id, levels=thread_order)) %>%
    dplyr::arrange(status_id) -> tweet_thread

  # extract the text and make it something readable
  dplyr::arrange(tweet_thread, created_at) %>%
    dplyr::pull(text) %>%
    paste0(collapse="\n\n") -> thread_text

  # HTML version of ^^
  dplyr::arrange(tweet_thread, created_at) %>%
    dplyr::rowwise() %>%
    dplyr::do(html = htmlify_tweet(.)) %>%
    dplyr::select(html) %>%
    tidyr::unnest(html) %>%
    dplyr::pull(html) -> thread_html

  # make a small data structure to hold both of ^^ since I dislike attributes
  list(
    tweet_thread = tweet_thread,
    thread_text = thread_text,
    thread_html = thread_html
  ) -> out

  class(out) <- c("tweet_thread") # class it so we can print it nicely

  out

}
