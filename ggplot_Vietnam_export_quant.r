# library
library(ggplot2)
library(tidyverse)
library(readr)

# Data
df <- read_csv("VN_export_quant.csv")
head(df)
#
options(scipen=100000)
p<- ggplot(data = df, aes(x = Year, y = Value, colour = Item)) +
    geom_point(size = 4, alpha = 0.7) +
    geom_line() +
    geom_point(colour = "NavyBlue", size = 0.5) +
    labs(
        title = "Export quantity on Wooden materials in Vietnam for 1992-2023",
        subtitle = "Data: FAO",
        y = bquote("Value"~(m^3)),
        x = "Year",
        color = "Wooden products (categories) in Vietnam:") +
    scale_color_brewer(palette = "Paired") +
#    scale_x_continuous(1992, 2023, by = 2) +
    scale_x_continuous(limits = c(1992, 2023), n.breaks = 30) +
    scale_y_continuous(n.breaks = 10, trans = "log10", labels = function(y) y / 100) +
    theme(
        legend.position = "bottom",
        legend.justification = c(1, 0),
        legend.text = element_text(size = 11),
        legend.title = element_text(size = 13),
        plot.title = element_text(size = 13),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        axis.text.x = element_text(face = 3, color = "gray24", size = 10, angle = 15),
        axis.text.y = element_text(face = 3, color = "gray24", size = 10, angle = 0),
    ) +
    guides(col = guide_legend(ncol = 4, title.position = "top"))
p
ggsave("Vietnam_export_quant.jpg", plot = p, dpi = 300, width = 10,
    height = 8, units = "in")
# or "top", "left", "right", "none" nrow = 4,
