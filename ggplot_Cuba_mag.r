# library
library(ggplot2)
library(tidyverse)
library(readr)
library(pals)
library(viridis)
# Data
df <- read.csv("IEB_export_Cuba.csv", sep = ",")
head(df)
#

mycolors <- colorRampPalette(brewer.pal(8, "Set2"))(31)

p<- ggplot(data = df, aes(x = Year, y = Mag, color = Mag)) +
    geom_line() +
    geom_point(size = 4, alpha = 0.7) +
    geom_point(colour = "NavyBlue", size = 0.5) +
#    geom_point(aes(colour = Mag), size = 4, alpha = 0.7) +
#    geom_line(aes(colour = Mag)) +
#    scale_colour_gradient(colours = c("royalblue","springgreen","yellow", "red")) +
#    scale_fill_manual(values = as.vector(jet(31))) +
#    scale_colour_brewer(palette = "Set1") +
#    scale_fill_manual(values = mycolors) +
    scale_x_continuous(
        limits = c(1973, 2025), breaks = seq(1973, 2025, by = 2)) +
    labs(
        title = "Seismic events in the region of Cuba during the past 5 decades (1973-2025)",
        subtitle = "Data: USGS",
        y = bquote("Richter scale, M" [L]),
        x = "Year",
        color = "Magnitude (Richter scale):") +
    theme(
        legend.position = "bottom",
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 12),
        plot.title = element_text(size = 14),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        ) +
    guides(col = guide_legend(title.position = "top", nrow = 2))
p
ggsave("Seismic_events_Cuba.jpg", plot = p, dpi = 300, width = 10,
    height = 8, units = "in")
# or "top", "left", "right", "none"
