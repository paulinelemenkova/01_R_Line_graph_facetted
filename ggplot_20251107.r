library(ggplot2)
df <- read.csv("01_Share in Forest land.csv")
head(df)

# select items by attribute in a column
Planted_Forest <- df[df$Item == "Planted Forest", ]
head(Planted_Forest)
#
Nat_reg_forest <- df[df$Item == "Naturally regenerating forest", ]
head(Nat_reg_forest)

ggplot(data = Planted_Forest, aes(x = Year, y = Value)) +
    geom_line() # Or any other geom
plot1 <- ggplot(Planted_Forest, aes(Year, Value, group = 1)) +
        geom_line(linetype = "solid", colour = "gray", size = 0.3) +
        geom_point(aes(colour = Value, size = Value)) +
        scale_colour_gradientn(colours = c("royalblue","springgreen","yellow", "red")) +
        labs(x = "Year", y = "Value (%)", title = "Share of planted forest in Italy, 1990-2025. Data: FAO")
plot1
plot2 <- ggplot(Nat_reg_forest, aes(Year, Value)) +
        geom_line(linetype = "solid", colour = "gray", size = 0.3) +
        geom_point(aes(colour = Value, size = Value)) +
        scale_colour_gradientn(colours = c("royalblue","springgreen","yellow", "red")) +
        labs(x = "Year", y = "Value (%)", title = "Share of naturally regenerating forest in Italy, 1990-2025. Data: FAO")
plot2

library(gridExtra)
grid.arrange(plot1, plot2, nrow=2)
