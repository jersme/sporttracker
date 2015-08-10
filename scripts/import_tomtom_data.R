## import data

## load required libraries
library(readr)
library(dplyr)

## load the data
df <- read.csv("data/import/Running_12-41-34.csv", sep = ",")

## add date and description to file
df <- df %>%
  mutate(description = "regular run",
         date = as.Date("2015-08-08"),
         type = "run")

## calculate line distance

line_distance <- data.frame(diff(as.matrix(df$distance)))
names(line_distance) <- "line.dist"
line_distance <- bind_rows(data.frame(line.dist = 0), line_distance)
df <- bind_cols(df, line_distance)
rm(line_distance)

## calculate real speed in km/h
df$speed.kmh <- df$speed * 3.6