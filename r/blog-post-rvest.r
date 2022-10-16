# install packages
    install.packages("tidyverse")
    install.packages("rvest")
    install.packages("lubridate")

# load packages
    library(tidyverse)
    library(rvest)
    library(lubridate)

# link to get data from
    link <- "https://en.wikipedia.org/wiki/Seinfeld"

# read webpage at the above link
    page <- read_html(link)

# scrape title
    title <- page %>%
        html_nodes(".tracklist td:nth-child(2)") %>%
        html_text()

# scrape episodes
    episodes <- page %>%
        html_nodes(".tracklist td:nth-child(3)") %>%
        html_text()

# scrape length
    length <- page %>%
        html_nodes(".tracklist-length") %>%
        html_text()

# create df
    df <- data.frame(title, episodes, length)

# remove quotes from data
    df$title <- gsub("\"", "", df$title)
    df$episodes <- gsub("\"", "", df$episodes)

# view top 6 records
    head(df)