# create activity views

## load required libaries
library(dplyr)
library(taucharts)

## plot a activity

tauchart(df) %>%
  tau_line("distance", "heartRate") %>%
  tau_trendline()

tauchart(df) %>%
  tau_line("distance", "speed.kmh") %>%
  tau_trendline()