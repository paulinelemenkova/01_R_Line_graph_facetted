# library
library(ggplot2)
library(tidyverse)
library(readr)

# Data
df <- read_csv("Tab_1_Population_1950_2023.csv")
head(df)
tail(df)

#--------- ex ---------->
# Select specific columns by name
selected_data <- original_data[, c("column_1", "column_2", "column_3")]

# For a single specific value within a column
df1 <- df[df$Element == "Total Population - Both sexes", ]

#--------- ex ----------<

df1 <- df[, c("Element", "Year", "Value")]
print(df1)
#--------- ex ---------->
library(dplyr)

# Sample data frame
df <- data.frame(
  ID = 1:10,
  Name = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Heidi", "Ivan", "Judy"),
  Category = c("A", "B", "A", "C", "B", "A", "C", "B", "A", "C"),
  Value = c(10, 20, 15, 25, 30, 12, 28, 35, 18, 22)
)

# Select 'Name' and 'Value' columns, and filter for rows where 'Category' is 'A' or 'C'
result_df <- df %>%
  select(Name, Value, Category) %>%
  filter(Category %in% c("A", "C"))
  
print(result_df)
#--------- ex ----------<


#--------- MY ---------->
df <- read_csv("Tab_1_Population_1950_2023.csv")
#head(df)

df <- df[, c("Element", "Year", "Value")]
#print(df)

df <- df %>%
  select(Element, Year, Value) %>%
  filter(Element %in% "Total Population - Both sexes")
  
print(df)
#--------- MY ----------<


p1<- ggplot(data = df, aes(x = Year, y = Value, colour=Element)) +
    geom_point(size = 3, alpha = 0.7, color = "purple") +
    geom_line() +
    scale_x_continuous(n.breaks = 10) +
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
        title = "Dynamics in population growth of Martinique for 1950-2023",
        subtitle = "Data: FAO",
        y = "Persons (1000)",
        x = "Year",
        color = "Population growth in Martinique(1950-2023)")
p1
