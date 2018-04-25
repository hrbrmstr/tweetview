#' Tools to Organize and Visualize Tweets Including Tweet Threads
#'
#' @name tweetview
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom purrr map map_df map_chr map_dbl keep discard walk2
#' @importFrom tidyr unnest
#' @importFrom utils globalVariables
#' @importFrom dplyr data_frame %>% bind_rows left_join bind_cols pull select filter arrange mutate do rowwise
#' @importFrom igraph as_data_frame decompose
#' @importFrom stringi stri_detect_fixed
#' @importFrom openssl base64_encode
#' @import rtweet
NULL
