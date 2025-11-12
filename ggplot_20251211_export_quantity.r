# library
library(ggplot2)
library(tidyverse)
library(readr)
library(viridis)

df <- read_csv("Table_export_quantity.csv")
head(df)

# ------------- facet_wrap ----------- >

options(scipen = 999)
library(scales)
library(ggplot2)
# facetted plot
p<- ggplot(df, aes(Year, Value, colour=Item)) +
    geom_point(size=3, alpha = 0.4) +
    geom_line() +
    geom_smooth(method = "loess", linewidth = 0.3) +
#    geom_smooth(method = "lm", linewidth = 0.5) + # Adds a linear regression line
    facet_wrap(~Item, scales = "free", ncol = 3,
        strip.position = "bottom") +
#    scale_color_brewer(palette = "Dark2") +
    scale_colour_viridis_d(option = "cividis") +
    scale_y_continuous(
    name = "Value (in 1000 tons)",
        labels = function(y) y / 1000
        ) +
#    theme(legend.position = "bottom",
#       legend.text = element_text(size = 10), ) +
  theme(legend.position = c(1, 0),
        legend.justification = c(1, 0),
        legend.text = element_text(size = 10)) +
    labs(color = "Forestry economics in Italy: Export quantity \n(in 1000 tons). Data: FAO") +
    guides(color = guide_legend(
        nrow = 8,
        theme = theme(
            legend.title = element_text(size = 11, face = "plain",
            colour = "black")
    )))
p
# Source - https://stackoverflow.com/a/54438496
ggsave("my_plot_export.jpg", plot = p, dpi = 300,
    width = 30, height = 25, units = "cm")
# or "top", "left", "right", "none"
