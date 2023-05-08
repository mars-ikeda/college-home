library(tidyverse)
Listings_boston.df <- read.csv("/Users/marsikeda/Smith College/SDS 236 Data Journalism/college-home/AirBnB data/Boston/listings.csv")
nabes_boston.df <- read.csv("/Users/marsikeda/Smith College/SDS 236 Data Journalism/college-home/AirBnB data/Boston/neighbourhoods.csv")

listings_nyc.df <- read.csv("/Users/marsikeda/Smith College/SDS 236 Data Journalism/college-home/AirBnB data/NYC/listings.csv")
nabes_nyc.df <- read.csv("/Users/marsikeda/Smith College/SDS 236 Data Journalism/college-home/AirBnB data/NYC/neighbourhoods.csv")

listings_RI.df <- read.csv("/Users/marsikeda/Smith College/SDS 236 Data Journalism/college-home/AirBnB data/Rhode Island/listings.csv")
nabes_RI.df <- read.csv("/Users/marsikeda/Smith College/SDS 236 Data Journalism/college-home/AirBnB data/Rhode Island/neighbourhoods.csv")

harvard.df <- Listings_boston.df |>
  select(id, neighbourhood, room_type, price, minimum_nights, availability_365)

harvard_ab.df <- harvard.df |>
  filter(neighbourhood == "Allston" | neighbourhood == "Brighton")

columbia.df <- listings_nyc.df |>
  select(id, neighbourhood, room_type, price, minimum_nights, availability_365)

columbia_mh.df <- columbia.df |>
  filter(neighbourhood == "Morningside Heights")

brown.df <- listings_RI.df |>
  select(id, neighbourhood, room_type, price, minimum_nights, availability_365)

brown_wp.df <- brown.df |>
  filter(neighbourhood == "East Providence")

harvard_sum.df <- harvard_ab.df |>
  group_by(neighbourhood) |>
  summarise(mean = mean(price),
            median = median(price))
  
columbia_sum.df <- columbia_mh.df |>
  summarise(mean = mean(price),
            median = median(price))

brown_sum.df <- brown_wp.df |>
  summarise(mean = mean(price),
            median = median(price))

harvard_allston.df <- harvard_ab.df |>
  filter(neighbourhood == "Allston")

harvard_brighton.df <- harvard_ab.df |>
  filter(neighbourhood == "Brighton")
  