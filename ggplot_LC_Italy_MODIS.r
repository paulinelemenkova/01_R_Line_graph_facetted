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
        y = bquote("Value"~(km^2)),
        x = "Year",
        color = "Land cover categories\n(major types):")
p1
ggsave("my_plot.jpg", plot = p, dpi = 300, width = 10,
    height = 8, units = "in")
# or "top", "left", "right", "none"
