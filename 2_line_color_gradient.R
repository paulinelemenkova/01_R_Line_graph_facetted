# ----------- EXAMPLE ---------------->
# Libraries
library(ggplot2)
library(dplyr)
library(patchwork) # To display 2 charts together

# Build dummy data
data <- data.frame(
  day = as.Date("2019-01-01") + 0:99,
  temperature = runif(100) + seq(1,100)^2.5 / 10000,
  price = runif(100) + seq(100,1)^1.5 / 10
)

# Most basic line chart
p1 <- ggplot(data, aes(x=day, y=temperature)) +
  geom_line(color="#69b3a2", linewidth=2) +
  ggtitle("Temperature: range 1-10") +
  theme_classic()
p1
p2 <- ggplot(data, aes(x=day, y=price)) +
  geom_line(color="grey",linewidth=2) +
  ggtitle("Price: range 1-100") +
theme_classic()
p2
# Display both charts side by side thanks to the patchwork package
p1 + p2
# ----------- EXAMPLE ----------------<

df <- read_csv("05_Area_per capita.csv")
head(df)
# line chart
p1 <- ggplot(df, aes(x = Year, y = Value, color = Value)) +
    geom_line() +
    geom_point(size = 3) +
    scale_color_gradient2(
        low = "blue",
        mid = "orange",
        high = "red",
        midpoint = 0.17,
        name = "Value Scale \nha/person"
    ) +
    ggtitle("Agricultural land area (cropland) per capita in Italy (ha/person). Data: FAO") +
    theme_grey()
p1
p2 <- ggplot(data, aes(x=day, y=price)) +
  geom_line(color="grey",linewidth=2) +
  ggtitle("Price: range 1-100") +
theme_classic()
p2
# Display both charts side by side thanks to the patchwork package
p1 + p2
# ----------- EXAMPLE ----------------<

# -----------EXAMPLE Color line gradient----------------->

df <- data.frame(
  x = 1:20,
  y = sin(1:20 / 2) + rnorm(20, sd = 0.5),
  value = c(rnorm(10, mean = -1), rnorm(10, mean = 1)) # Continuous variable for color
)

# Create a line plot with divergent color gradient
ggplot(df, aes(x = x, y = y, color = value)) +
  geom_line(size = 1) +
  scale_color_gradient2(
    low = "blue",      # Color for low values
    mid = "white",     # Color for the midpoint
    high = "red",      # Color for high values
    midpoint = 0,      # The value at which colors diverge
    name = "Value Scale"
  ) +
  labs(title = "Line Plot with Divergent Color Gradient") +
  theme_minimal()
# ----------- EXAMPLE ----------------<

df <- read_csv("06_Value_agri.csv")
head(df)
# line chart
p1 <- ggplot(df, aes(x = Year, y = Value, color = Value)) +
    geom_line() +
    geom_point(size = 3) +
    scale_colour_steps2(
        low = "blue",
        mid = "orange",
        high = "red",
        midpoint = 2800,
   #     n.breaks = 20,
        nice.breaks = T,
        name = "Value scale \nUSD_PPP/ha"
    ) +
    ggtitle("Value of agricultural production (Int. $) per area in Italy (USD_PPP/ha). Data: FAO") +
    theme_grey()
p1
