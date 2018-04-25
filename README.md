
WIP WIP WIP WIP WIP WIP

# tweetview

Tools to Organize and Visualize Tweets

## Description

## What’s Inside The Tin

The following functions are implemented:

  - `as_tweet_thread`: Turn a data frame of ‘rtweet’ tweets into a tweet
    thread
  - `get_thread`: Retrieve an authors tweet thread/rant from a starting
    status id
  - `htmlify_tweet`: Make a Tweet into an HTML object
  - `print.tweet_thread`: Print method for a tweet thread
  - `style_tweet`: Style a tweet with HTML

## Installation

``` r
devtools::install_github("hrbrmstr/tweetview")
```

## Usage

``` r
library(tweetview)
library(tidyverse)

# current verison
packageVersion("tweetview")
```

    ## [1] '0.1.0'

``` r
thrd <- get_thread("988895496381984770")

thrd
```

    ## Malware trend observation: Attackers rely on knowing which industries and individuals are likely to not be following best practices, as many ‘newsworthy’ events in the past couple weeks were malware or techniques that even well maintained basic antivirus would stop.
    ## 
    ## Whether it’s miner malware targeting individuals that pirate software/movies and are likely to have AV turned off, or ‘brand new’ APT reports that are using techniques easily detected by AV, many things recently are simply attackers relying on basics not being in place.
    ## 
    ## If you have served any time as an IT person you will know certain industries think they ‘can’t’ do certain security measures such as patch/segment/least privilege-attackers know that too and are clearly using it as an easy mode entry point.
    ## 
    ## Some regions stay on old versions of productivity software due to linguistic reasons (IMEs/plugins) and that is 100% something targeted attacks know-many cases we research quite simply wouldn’t work with up to date AV and software.
    ## 
    ## There’s no mystical superpowers in most attacks, and we need to make that clear when we talk about how to harden environments. Observing trends that are used by attackers, discussing them honestly, and providing creative mitigations goes a long way to protecting actual people.
    ## 
    ## I’ve also investigated many cases involving actual mystical attacker superpowers in my time, and basic understanding and protections still go a long way to securing the humans in those instances too.

``` r
str(thrd, 1)
```

    ## List of 3
    ##  $ tweet_thread:Classes 'tbl_df', 'tbl' and 'data.frame':    6 obs. of  87 variables:
    ##  $ thread_text : chr "Malware trend observation: Attackers rely on knowing which industries and individuals are likely to not be foll"| __truncated__
    ##  $ thread_html : chr [1:6] "<div class=\"tweet-div\"><div class=\"tweet-intro\" style=\"display:block\"><span class=\"tweet-source\">@jepay"| __truncated__ "<div class=\"tweet-div\"><div class=\"tweet-intro\" style=\"display:block\"><span class=\"tweet-source\">@jepay"| __truncated__ "<div class=\"tweet-div\"><div class=\"tweet-intro\" style=\"display:block\"><span class=\"tweet-source\">@jepay"| __truncated__ "<div class=\"tweet-div\"><div class=\"tweet-intro\" style=\"display:block\"><span class=\"tweet-source\">@jepay"| __truncated__ ...
    ##  - attr(*, "class")= chr "tweet_thread"

``` r
glimpse(thrd$tweet_thread)
```

    ## Observations: 6
    ## Variables: 87
    ## $ user_id                 <chr> "3937965861", "3937965861", "3937965861", "3937965861", "3937965861", "3937965861"
    ## $ status_id               <fct> 988901012114042880, 988897418845405184, 988896682543759360, 988896363864707072, 988...
    ## $ created_at              <dttm> 2018-04-24 22:02:28, 2018-04-24 21:48:12, 2018-04-24 21:45:16, 2018-04-24 21:44:00...
    ## $ screen_name             <chr> "jepayneMSFT", "jepayneMSFT", "jepayneMSFT", "jepayneMSFT", "jepayneMSFT", "jepayne...
    ## $ text                    <chr> "I’ve also investigated many cases involving actual mystical attacker superpowers i...
    ## $ source                  <chr> "Twitter for iPhone", "Twitter for iPhone", "Twitter for iPhone", "Twitter for iPho...
    ## $ display_text_width      <dbl> 199, 277, 231, 240, 270, 266
    ## $ reply_to_status_id      <chr> "988897418845405184", "988896682543759360", "988896363864707072", "9888960148651294...
    ## $ reply_to_user_id        <chr> "3937965861", "3937965861", "3937965861", "3937965861", "3937965861", NA
    ## $ reply_to_screen_name    <chr> "jepayneMSFT", "jepayneMSFT", "jepayneMSFT", "jepayneMSFT", "jepayneMSFT", NA
    ## $ is_quote                <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
    ## $ is_retweet              <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
    ## $ favorite_count          <int> 50, 87, 46, 91, 58, 241
    ## $ retweet_count           <int> 6, 27, 12, 21, 17, 110
    ## $ hashtags                <list> [NA, NA, NA, NA, NA, NA]
    ## $ symbols                 <list> [NA, NA, NA, NA, NA, NA]
    ## $ urls_url                <list> [NA, NA, NA, NA, NA, NA]
    ## $ urls_t.co               <list> [NA, NA, NA, NA, NA, NA]
    ## $ urls_expanded_url       <list> [NA, NA, NA, NA, NA, NA]
    ## $ media_url               <list> [NA, NA, NA, NA, NA, NA]
    ## $ media_t.co              <list> [NA, NA, NA, NA, NA, NA]
    ## $ media_expanded_url      <list> [NA, NA, NA, NA, NA, NA]
    ## $ media_type              <list> [NA, NA, NA, NA, NA, NA]
    ## $ ext_media_url           <list> [NA, NA, NA, NA, NA, NA]
    ## $ ext_media_t.co          <list> [NA, NA, NA, NA, NA, NA]
    ## $ ext_media_expanded_url  <list> [NA, NA, NA, NA, NA, NA]
    ## $ ext_media_type          <chr> NA, NA, NA, NA, NA, NA
    ## $ mentions_user_id        <list> [NA, NA, NA, NA, NA, NA]
    ## $ mentions_screen_name    <list> [NA, NA, NA, NA, NA, NA]
    ## $ lang                    <chr> "en", "en", "en", "en", "en", "en"
    ## $ quoted_status_id        <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_text             <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_created_at       <dttm> NA, NA, NA, NA, NA, NA
    ## $ quoted_source           <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_favorite_count   <int> NA, NA, NA, NA, NA, NA
    ## $ quoted_retweet_count    <int> NA, NA, NA, NA, NA, NA
    ## $ quoted_user_id          <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_screen_name      <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_name             <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_followers_count  <int> NA, NA, NA, NA, NA, NA
    ## $ quoted_friends_count    <int> NA, NA, NA, NA, NA, NA
    ## $ quoted_statuses_count   <int> NA, NA, NA, NA, NA, NA
    ## $ quoted_location         <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_description      <chr> NA, NA, NA, NA, NA, NA
    ## $ quoted_verified         <lgl> NA, NA, NA, NA, NA, NA
    ## $ retweet_status_id       <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_text            <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_created_at      <dttm> NA, NA, NA, NA, NA, NA
    ## $ retweet_source          <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_favorite_count  <int> NA, NA, NA, NA, NA, NA
    ## $ retweet_retweet_count   <int> NA, NA, NA, NA, NA, NA
    ## $ retweet_user_id         <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_screen_name     <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_name            <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_followers_count <int> NA, NA, NA, NA, NA, NA
    ## $ retweet_friends_count   <int> NA, NA, NA, NA, NA, NA
    ## $ retweet_statuses_count  <int> NA, NA, NA, NA, NA, NA
    ## $ retweet_location        <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_description     <chr> NA, NA, NA, NA, NA, NA
    ## $ retweet_verified        <lgl> NA, NA, NA, NA, NA, NA
    ## $ place_url               <chr> NA, NA, NA, NA, NA, NA
    ## $ place_name              <chr> NA, NA, NA, NA, NA, NA
    ## $ place_full_name         <chr> NA, NA, NA, NA, NA, NA
    ## $ place_type              <chr> NA, NA, NA, NA, NA, NA
    ## $ country                 <chr> NA, NA, NA, NA, NA, NA
    ## $ country_code            <chr> NA, NA, NA, NA, NA, NA
    ## $ geo_coords              <list> [<NA, NA>, <NA, NA>, <NA, NA>, <NA, NA>, <NA, NA>, <NA, NA>]
    ## $ coords_coords           <list> [<NA, NA>, <NA, NA>, <NA, NA>, <NA, NA>, <NA, NA>, <NA, NA>]
    ## $ bbox_coords             <list> [<NA, NA, NA, NA, NA, NA, NA, NA>, <NA, NA, NA, NA, NA, NA, NA, NA>, <NA, NA, NA, ...
    ## $ name                    <chr> "Jessica Payne", "Jessica Payne", "Jessica Payne", "Jessica Payne", "Jessica Payne"...
    ## $ location                <chr> "", "", "", "", "", ""
    ## $ description             <chr> "Security Person at Microsoft, currently in Windows Defender Security Research. Opi...
    ## $ url                     <chr> "https://t.co/vMahqHd0cp", "https://t.co/vMahqHd0cp", "https://t.co/vMahqHd0cp", "h...
    ## $ protected               <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
    ## $ followers_count         <int> 20975, 20975, 20975, 20975, 20975, 20975
    ## $ friends_count           <int> 32, 32, 32, 32, 32, 32
    ## $ listed_count            <int> 556, 556, 556, 556, 556, 556
    ## $ statuses_count          <int> 3580, 3580, 3580, 3580, 3580, 3580
    ## $ favourites_count        <int> 2685, 2685, 2685, 2685, 2685, 2685
    ## $ account_created_at      <dttm> 2015-10-12 14:57:35, 2015-10-12 14:57:35, 2015-10-12 14:57:35, 2015-10-12 14:57:35...
    ## $ verified                <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
    ## $ profile_url             <chr> "https://t.co/vMahqHd0cp", "https://t.co/vMahqHd0cp", "https://t.co/vMahqHd0cp", "h...
    ## $ profile_expanded_url    <chr> "https://aka.ms/jessica", "https://aka.ms/jessica", "https://aka.ms/jessica", "http...
    ## $ account_lang            <chr> "en", "en", "en", "en", "en", "en"
    ## $ profile_banner_url      <lgl> NA, NA, NA, NA, NA, NA
    ## $ profile_background_url  <chr> "http://abs.twimg.com/images/themes/theme1/bg.png", "http://abs.twimg.com/images/th...
    ## $ profile_image_url       <chr> "http://pbs.twimg.com/profile_images/665837116778123264/Hy0NY3gv_normal.jpg", "http...

There’s a vanilla HTML-ified version of that text in `$thread_html`. Run
this to see it and you can add your own CSS styling. The vignette source
has some example CSS.

``` r
htmltools::html_print(htmltools::HTML(thrd$thread_html))
```
