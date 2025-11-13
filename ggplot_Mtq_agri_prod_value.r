# library
library(ggplot2)
library(tidyverse)
library(readr)

df <- read_csv("Tab_Value_agricult_Prod.csv")
head(df)
print(df)

df <- df[, c("Item", "Year", "Value")]
print(df)

df <- df[df$Item %in% c(
    "Sugarcane",
    "Bananas",
    "Pineapples",
    "Avocados",
    "Coffee",
    "Yams",
    "Sweet potatoes",
    "Eggplants",
    "Oranges"), ]

#--------- ex ---------->
library(dplyr)

p<- ggplot(df, aes(Year, Value, colour=Item)) +
    geom_point(size=3, alpha = 0.8) +
    geom_line() +
#    geom_smooth(method = "loess", linewidth = 0.3) +
    geom_smooth(method = "lm", linewidth = 0.3) + # linear regression line
    facet_wrap(~Item, scales = "free", ncol = 3,
        strip.position = "top") +
#    scale_color_brewer(palette = "Dark2") +
    scale_color_brewer(palette = "Set1") +
#    scale_colour_viridis_d(option = "inferno") +
    scale_y_continuous() +
#    name = "Value (in 1000 USD)") +
    theme(legend.position = c(0.9, 0),
        legend.justification = c(1, 0),
        legend.text = element_text(size = 10),
        strip.text = element_text(
            face = "bold", # Options: "plain", "bold", "italic", "bold.italic"
            size = 11,
            color = "black"
        )) +
    labs(
        title = "Value of agricultural production in Martinique, GPD for 1960-2023",
        subtitle = "Data: FAO",
        y = "Value (in 1000 USD)",
        x = "Year",
        color = "Agricultural products") +
    guides(color = guide_legend(
        nrow = 8,
        theme = theme(
            legend.title = element_text(size = 11, face = "plain",
            colour = "black")
    )))
p
ggsave("Fig_agri_prod_value.jpg", plot = p, dpi = 300,
    width = 24, height = 24, units = "cm")
