# library
library(ggplot2)
library(tidyverse)
library(readr)
# basic plots
df <- read_csv("Forestry_production_quantity.csv")
head(df)

df <- read_csv("Paper_production.csv")
head(df)
#
ggplot(data = df, aes(x = Year, y = Value)) +
  geom_point() # scatter plot
#
ggplot(data = df, aes(x = Year, y = Value)) +
    geom_line() # lines
#
ggplot(data = df, aes(x = Year, y = Value)) +
    geom_smooth() # smoothed conditional means, show trends in noisy data.
#
ggplot(data = df, aes(x = Year, y = Value)) +
    geom_area() # area charts, cumulative area under a line is filled
#
ggplot(data = df, aes(x = Year, y = Value)) +
    geom_tile() # tiles representing rectangular regions.
#
ggplot(data = df, aes(x=Year)) +
    geom_density() # moothed density
#

# ------------- EXAMPLE ----------- > select items by attribute in a column

# Boxplots Grouping by 'category' using fill  for box plots and bar plots
ggplot(df, aes(Item, Value, group = Item, fill = Item)) +
    geom_boxplot() +
    scale_color_brewer(palette = "Set1")

options(scipen = 999)
library(scales)
library(ggplot2)
# facetted plot
p<- ggplot(df, aes(Year, Value, colour=Item)) +
    geom_point(size=3, alpha = 0.5) +
    geom_line() +
#    geom_smooth(method = "loess") +
    geom_smooth(method = "lm", linewidth = 0.5) + # Adds a linear regression line
    facet_wrap(~Item, scales = "free", ncol = 3,
        strip.position = "bottom") +
    scale_color_brewer(palette = "Dark2") +
    scale_y_continuous(
    name = "Value (in 1000 tons)",
        labels = function(y) y / 1000
        ) +
#    theme(legend.position = "bottom",
#       legend.text = element_text(size = 10), ) +
  theme(legend.position = c(1, 0),
        legend.justification = c(1, 0),
        legend.text = element_text(size = 10)) +
    labs(color = "Forestry economics in Italy: Paper production in 1961-2023 (in 1000 tons). Data: FAO") +
    guides(color = guide_legend(
        nrow = 5,
        theme = theme(
            legend.title = element_text(size = 11, face = "plain",
            colour = "black")
    )))
p
# Source - https://stackoverflow.com/a/54438496
# Posted by Z.Lin, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-11, License - CC BY-SA 4.0
ggsave("my_plot.png", plot = p, dpi = 300, width = 10,
    height = 8, units = "in")
# or "top", "left", "right", "none"
