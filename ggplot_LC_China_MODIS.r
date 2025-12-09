# library
library(ggplot2)
library(tidyverse)
library(readr)

# Data
df <- read_csv("table_China_LCC_MODIS.csv")
head(df)
#
p<- ggplot(df, aes(Year, Value, colour = Item)) +
    geom_point(size=3, alpha = 0.8) +
    geom_line() +
#    geom_text(aes(label = Value), vjust = 2, colour = "white", size = 2.5) +
#    geom_smooth(method = "loess", linewidth = 0.3) +
    geom_smooth(method = "lm", linewidth = 0.3) + # linear regression line
    facet_wrap(~Item, scales = "free", ncol = 3,
        strip.position = "top") +
    scale_color_brewer(palette = "Dark2") +
    scale_x_continuous(limits = c(2013, 2023), breaks = seq(2013, 2023, by = 2)) +
    scale_y_continuous(
        labels = function(y) y / 1000
    ) +
    theme(
#    legend.position = "bottom",
        legend.position = c(1, 0),
        legend.justification = c(1, 0.1),
        legend.text = element_text(size = 10),
        strip.text = element_text(
            face = "bold", # Options: "plain", "bold", "italic", "bold.italic"
            size = 11,
            color = "black"
        )) +
    labs(
        title = "La dynamique de la couverture terrestre à Chine, 2013-2023",
        subtitle = "Données: Les images satellitaires Landsat 8-9 OLI/TIRS",
        y = "Valeur: 1000 ha",
        x = "Année",
        color = "Catégories de couverture terrestre:") +
    guides(color = guide_legend(
        nrow = 8,
        theme = theme(
            legend.title = element_text(size = 11, face = "plain",
            colour = "black")
    )))
p

ggsave("China_MODIS.jpg", plot = p, dpi = 300, width = 10,
    height = 8, units = "in")
# or "top", "left", "right", "none"
