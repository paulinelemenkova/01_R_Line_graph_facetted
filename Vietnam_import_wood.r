# library
library(ggplot2)
library(tidyverse)
library(readr)
library(dplyr)

df <- read_csv("Vietnam_import_wood.csv")
head(df)
#print(df)
#--------- ex ---------->

p<- ggplot(df, aes(Year, Value, colour = Item)) +
#    geom_point(shape = 21, size=3, alpha = 0.8, stroke = 0.5) +
    geom_point(shape = 20, size=4, alpha = 0.8, stroke = 1) +
    geom_line() +
    geom_point(colour = "NavyBlue", size = 0.1) +
#    geom_smooth(method = "loess", linewidth = 0.3) +
    geom_smooth(method = "lm", linewidth = 0.3) + # linear regression line
    facet_wrap(~Item, scales = "free", ncol = 4,
        strip.position = "top",
        labeller = label_wrap_gen(width = 30)) +
#    scale_color_brewer(palette = "Dark2") +
#    scale_color_brewer(palette = "Set1") +
    scale_colour_viridis_d(option = "turbo") +
    scale_y_continuous(
name = "Value (in 1000 tons)",
    labels = function(y) y / 1000
    ) +
#    scale_y_continuous() +
#    name = "Value (in 1000 USD)") +
    theme(legend.position = "bottom",
        legend.justification = c(1, 0),
        legend.text = element_text(size = 10),
        strip.text = element_text(
            face = "plain", # Options: "plain", "bold", "italic", "bold.italic"
            size = 11,
            color = "black"
        )) +
    labs(
        title = "Import of wooden products in Vietnam ",
        subtitle = "Data: FAO",
        y = bquote("Quantity"~(m^3)),
        x = "Year",
        color = "Categories of wooden products: FAO data") +
    guides(color = guide_legend(nrow = 3, title.position = "top",
            legend.title = element_text(size = 11, face = "plain", colour = "black")))
p
ggsave("VN_import_Wood.jpg", plot = p, dpi = 300,
    width = 30, height = 20, units = "cm")
