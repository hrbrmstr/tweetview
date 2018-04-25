#' Make a Tweet into an HTML object
#'
#' @param x one row from a rtweet data frame
#' @param avatar display avatars
#' @param images display images
#' @return HTML representation of the tweet (character)
#' @export
htmlify_tweet <- function(x, avatar=FALSE, images=FALSE) {

  url_pattern <- "(http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+)"

  txt <- x$text

  hashtags <- unlist(x$hashtags)
  if (!is.na(hashtags[1])) {
    for (h in hashtags) {
      h <- sprintf("#%s", h)
      txt <- stringi::stri_replace_all_fixed(txt, h, sprintf('<span class="tweet-hashtag">%s</span>', h))
    }
  }

  ppl <- unlist(x$mentions_screen_name)
  if (!is.na(ppl[1])) {
    for (p in ppl) {
      p <- sprintf("@%s", p)
      txt <- stringi::stri_replace_all_fixed(txt, p, sprintf('<span class="tweet-mention">%s</span>', p))
    }
  }

  urls <- unlist(x$urls_t.co)
  if (!is.na(urls[1])) {
    xpu <- unlist(x$urls_expanded_url)
    for (i in 1:length(urls)) {
      txt <- stringi::stri_replace_all_fixed(txt, urls[i], xpu[i])
    }
  }

  txt <- stringi::stri_replace_all_regex(txt, url_pattern, '<a class="tweet-lnk" href="$1">$1</a>')

  imgs <- ""

  mu1 <- unlist(x$media_url)
  if (!is.na(mu1[[1]])) {
    t1 <- unlist(x$media_type)
    walk2(mu1, t1, ~{
      if (.y == "photo") {
        imgs <<- sprintf("%s <img class='tweet-img' src='%s'/>", imgs, .x)
      }
    })
  }

  who <- sprintf('<span class="tweet-source">@%s</span>', x$screen_name)
  when <- sprintf('<span class="tweet-ts">%s</span>', as.character(x$created_at))
  src <- sprintf('<div class="tweet-intro" style="display:block">%s %s</div>', who, when)

  txt <- gsub("\\n", "<br/>", txt)

  tweet <- sprintf('<div class="tweet-div">%s%s %s</div>', src, txt, imgs)

  if (avatar) {

    sprintf(
      '<table class="tweet-wrap"><tr valign="top"><td class="tweet-avatar">%s</td><td>%s</td></tr></table>',
      sprintf('<div class="tweet-avatar-img-crop"><img class="tweet-avatar-img" style="width:48px; height:48px" src="https://twitter.com/%s/profile_image?size=normal"/></div>', x$screen_name),
      tweet
    ) -> tweet

  }

  tweet

}
