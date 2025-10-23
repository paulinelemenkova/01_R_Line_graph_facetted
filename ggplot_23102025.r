# library
library(ggplot2)
library(tidyverse)
library(readr)
# basic plots
PolinaTable <- read_csv("FAOSTAT_Rice.csv")
head(PolinaTable)

ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
  geom_point() # scatter plot

ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_line() # lines

ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_smooth() # smoothed conditional means, show trends in noisy data.

ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_area() # area charts, area under a line is filled for visualizing cumulative data or distributions
ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_tile() # tiles representing rectangular regions.

ggplot(data = PolinaTable, aes(x=Year)) +
    geom_density() # moothed density
