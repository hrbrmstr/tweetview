#' Style a tweet with HTML
#'
#' @param x tweet (1 row from an `rtweet` data frame)
#' @param avatar,images include avatars/images?
#' @param css your own CSS to use vs the default
#' @param theme light or dark theme?
#' @param print display the tweet after styling?
#' @return a styled tweet (invisibly)
#' @export
style_tweet <- function(x, avatar=FALSE, images=FALSE, css=NULL,
                        theme=c("light", "dark"), print=TRUE) {

  theme <- match.arg(theme, c("light", "dark"))

  border <- if (avatar) "0px" else "0.5px solid rgba(27, 40, 54, 0.5);"
  img <- if (images) "block" else "none"

  list(
    light = gsub("YYY", img, gsub("XXX", border, "<style>
.tweet-wrap { width: 564px; vertical-align: top; border: 1px solid #b2b2b2 !important; padding: 6pt; border-radius: 5px !important; margin-bottom: 4pt; }
div.tweet-avatar-img-crop { width: 48px; height: 48px; position: relative; overflow: hidden; border-radius: 50% !important; }
td.tweet-avatar { padding-top: 16px }
.tweet-div { font-family: 'Helvetica Neue', sans-serif; font-weight: 300; font-size: 1em; line-height: 1.3em; border: XXX; border-radius: 5px; width: 494px; display: block; padding: 12px 6px 12px 6px; margin-bottom: 4pt; }
a.tweet-lnk { font-size: 0.85em; line-height: 1.3em; text-decoration: none; color:rgb(29, 161, 242) }
img.tweet-img { display: YYY; max-width:100%; border: 0.25px dotted black; margin-top:12px; }
span.tweet-hashtag { color:rgb(29, 161, 242) }
div.tweet-intro { margin-bottom:6px }
span.tweet-mention { color:rgb(29, 161, 242) }
span.tweet-source { font-size: 1.1em; font-weight: 700 }
span.tweet-ts { font-size: 0.75em; line-height: 1.3em; color=#2b2b2b }
</style>")),

    dark = gsub("YYY", img, gsub("XXX", border, "<style>
.tweet-wrap { width: 564px; vertical-align: top; border: 1px solid #b2b2b2 !important; padding: 6pt; border-radius: 5px !important; background-color: rgb(27, 40, 54); margin-bottom: 4pt; }
div.tweet-avatar-img-crop { width: 48px; height: 48px; position: relative; overflow: hidden; border-radius: 50% !important; }
td.tweet-avatar { padding-top: 16px }
.tweet-div { font-family: 'Helvetica Neue', sans-serif; font-weight: 300; font-size: 1em; line-height: 1.3em; border: %s; border-radius: 5px; width: 494px; display: block; padding: 12px 6px 12px 6px; margin-bottom: 4pt; color:white; background-color: rgb(27, 40, 54) }
a.tweet-lnk { font-size: 0.85em; line-height: 1.3em; text-decoration: none; color:rgb(29, 161, 242) }
img.tweet-img { display: YYY; max-width:100%;border: 0.25px dotted black; margin-top:12px; }
span.tweet-hashtag { color:rgb(29, 161, 242) }
div.tweet-intro { margin-bottom:6px }
span.tweet-mention { color:rgb(29, 161, 242) }
span.tweet-source { font-size: 1.1em; font-weight: 700 }
span.tweet-ts { font-size: 0.75em; line-height: 1.3em; color=#2b2b2b }
</style>"))) -> themes

  css <- if (is.null(css)) themes[[theme]] else css

  htmlify_tweet(x[1,], avatar=avatar) %>%
    sprintf("%s%s", css, .) -> out

  if (print) htmltools::html_print(htmltools::HTML(out))

  invisible(out)

}

