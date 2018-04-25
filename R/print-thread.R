#' Print method for a tweet thread
#'
#' @param x thee tweet thread object
#' @param html print the HTML or text version of the tweet
#' @param avatar,images include avatars/images?
#' @param css custom CSS for the HTML tweet thread
#' @param theme dark or light theme?
#' @param ... unused
#' @return the tweet thread object (invisibly)
#' @export
print.tweet_thread <- function(x, html=FALSE, avatar=TRUE, images=TRUE,
                               css=NULL, theme=c("light", "dark"), ...) {

  if (html) {

    thread <- ""
    for (i in 1:nrow(x$tweet_thread)) {
      thread <- sprintf("%s\n%s", thread,
                        style_tweet(x$tweet_thread[i,], avatar=avatar, images=images,
                                    css=css, theme=theme, print=FALSE))
    }

    htmltools::html_print(htmltools::HTML(thread))

  } else {
    cat(x$thread_text, "\n", sep="")
  }

  invisible(x)

}
