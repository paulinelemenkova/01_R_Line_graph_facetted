# library
library(ggplot2)
library(tidyverse)
library(readr)

# Data
df <- read_csv("LC_MODIS.csv")
#head(df)
#
p1<- ggplot(data = df, aes(x = Year, y = Value, colour=Item)) +
    geom_point(size = 5, alpha = 0.7) +
    geom_line() +
    scale_color_brewer(palette = "Paired") +
    scale_y_continuous(trans = "log10",
        labels = function(y) y / 100
    ) +
    theme(
        legend.position = "bottom",
        legend.justification = c(1, 0),
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 12),
        plot.title = element_text(size = 14),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
    ) +
    labs(
        title = "Land cover type dynamics in Italy for 2001-2023",
        subtitle = "Data: MODIS",
        y = bquote(Value~(km^2)),
        x = "Year",
        color = "Land cover categories\n(major types):")
p1

# 2nd plot

df <- read_csv("Table_forest_emissions_area.csv")

# Perform linear interpolation to fill in missing y values

p2<- ggplot(data = df, aes(x = Year, y = Value)) +
    geom_line(color = "purple") +
    geom_smooth(method = "loess", linewidth = 0.3) +
    geom_point(aes(colour = Value, size = Year), alpha = 0.9) +
    scale_colour_gradientn(colours = c("royalblue","springgreen","yellow", "red")) +
    scale_size_continuous(range = c(2.5, 5.0)) +
    scale_x_continuous(
        breaks = seq(1990, 2025, by = 5)
        ) +
    scale_y_continuous(
        labels = function(y) y / 1000
        ) +
    labs(
        x = "Year",
        y = "Value (1000 ha)",
        title = bquote("Forest net emissions - removals of"~CO[2]),
        subtitle = "Data: FAO") +
    theme(
        plot.title = element_text(size = 14),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        legend.title = element_text(size = 12)
        ) #+
#   theme_dark()
p2

library(grid)
library(gridExtra)
p3<- grid.arrange(p1, p2, ncol=2)
p3

ggsave("my_plots_two.jpg",
    plot = p3, dpi = 300,
    width = 20,
    height = 8,
    units = "in"
    )
