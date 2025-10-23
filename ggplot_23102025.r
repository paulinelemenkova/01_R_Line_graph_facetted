# library
library(ggplot2)
library(tidyverse)
library(readr)
# basic plots
PolinaTable <- read_csv("FAOSTAT_Rice.csv")
head(PolinaTable)
#
ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
  geom_point() # scatter plot
#
ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_line() # lines
#
ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_smooth() # smoothed conditional means, show trends in noisy data.
#
ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_area() # area charts, cumulative area under a line is filled
#
ggplot(data = PolinaTable, aes(x = Year, y = Value)) +
    geom_tile() # tiles representing rectangular regions.
#
ggplot(data = PolinaTable, aes(x=Year)) +
    geom_density() # moothed density
#
PolinaTable <- read_csv("FAOSTAT_India.csv")
head(PolinaTable)
tail(PolinaTable)

# select items by attribute in a column
# 1 Cashew
Cashew <- PolinaTable[PolinaTable$Item == "Cashew", ]
head(Cashew)
tail(Cashew)
ggplot(data = Cashew, aes(x = Year, y = Value)) +
    geom_line() # Or any other geom
plot1 <- ggplot(Cashew, aes(Year, Value, group = 1)) +
         geom_point() +
         geom_line() +
         labs(x = "Year", y = "Value", title = "Cashew")
plot1
# 2 Rice
Rice <- PolinaTable[PolinaTable$Item == "Rice", ]
head(Rice)
tail(Rice)
#
plot2 <- ggplot(Rice, aes(Year, Value, group = 1)) +
         geom_point() +
         geom_line() +
         labs(x = "Year", y = "Value", title = "Rice")
plot2
# 3 Wheat
Wheat <- PolinaTable[PolinaTable$Item == "Wheat", ]
head(Wheat)
tail(Wheat)
#
plot3 <- ggplot(Wheat, aes(Year, Value, group = 1)) +
         geom_point() +
         geom_line() +
         labs(x = "Year", y = "Value", title = "Wheat")
plot3
# 4 Lemons and limes
Lemons <- PolinaTable[PolinaTable$Item == "Lemons and limes", ]
head(Lemons)
tail(Lemons)
#
plot4 <- ggplot(Lemons, aes(Year, Value, group = 1)) +
         geom_point() +
         geom_line() +
         labs(x = "Year", y = "Value", title = "Lemons and limes")
plot4
# 5 Areca nuts
Areca <- df[df$Item == "Areca nuts", ]
head(Areca)
tail(Areca)
#
plot4 <- ggplot(Areca, aes(Year, Value, group = 1)) +
         geom_point() +
         geom_line() +
         labs(x = "Year", y = "Value", title = "Areca nuts")
plot4
#
# Map variables of one column to color
df <- read_csv("FAOSTAT_India_10.csv")
head(df)
tail(df)
ggplot(data=df, aes(x=Year, y=Value, group=Item, colour=Item)) +
    geom_line() +
    geom_point()

df <- read_csv("FAOSTAT_India_10.csv")
summary(df)
head(df)
tail(df)
str(df)
ggplot(data=df, aes(x=Year, y=Value, group=Item, colour=Item, group = interaction(Cashew, Cabbages))) +
    geom_line() +
    geom_point() +
    scale_color_brewer(palette = "Set1")

# Boxplots Grouping by 'category' using fill  for box plots and bar plots
ggplot(df, aes(Item, Value, group = Item, fill = Item)) +
    geom_boxplot() +
    scale_color_brewer(palette = "Set1")

# facetted plot
ggplot(df, aes(Year, Value, colour=Item)) +
    geom_point() +
    geom_line() +
    facet_wrap(~Item, scales = "free") +
    theme(legend.position = "bottom")
# or "top", "left", "right", "none"

),
