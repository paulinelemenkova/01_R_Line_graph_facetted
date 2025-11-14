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

df1 <- df %>%
  select(Element, Year, Value) %>%
  filter(Element %in% "Total Population - Both sexes")

df2 <- df %>%
  select(Element, Year, Value) %>%
  filter(Element %in% "Total Population - Male")

df3 <- df %>%
  select(Element, Year, Value) %>%
  filter(Element %in% "Total Population - Female")
  
print(df1)
print(df2)
print(df3)
#--------- MY ----------<


p1<- ggplot() +
    geom_point(data=df2, aes(x = Year, y = Value, colour = "Element"),
        size = 3, alpha = 0.7, color = "blue") +
    geom_point(data=df3, aes(x = Year, y = Value, colour = "Element"),
        size = 3, alpha = 0.7, color = "red") +
    geom_line() +
    scale_x_continuous(n.breaks = 10) +
    theme(
        legend.position = "bottom",
        legend.justification = c(0, 0),
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
        y = "Persons",
        x = "Year")
p1

p1<- ggplot() +
    geom_point(data=df, aes(x = Year, y = Value, colour = Element),
        size = 3, alpha = 0.7, color = "blue") +
    geom_line() +
    scale_x_continuous(n.breaks = 10) +
    theme(
        legend.position = "bottom",
        legend.justification = c(0, 0),
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
        y = "Persons",
        x = "Year")
p1
#Population growth in Martinique(1950-2023)

# -------------ex ------------>
library(ggplot2)

# Sample data
data <- data.frame(
  category = c("A", "B", "C", "A", "B", "C", "D"),
  value = c(10, 15, 20, 12, 18, 22, 25)
)

# Select specific values from 'category' column
subset_data <- data[data$category %in% c("A", "C"), ]

# Plotting the subset
ggplot(subset_data, aes(x = category, y = value)) +
  geom_col()
# -------------ex ------------<


# ------------- genders ------------>
df <- read_csv("Tab_1_Population_1950_2023.csv")
#head(df)

df <- df[, c("Element", "Year", "Value")]
#print(df)

df <- df[df$Element %in% c("Total Population - Both sexes", "Total Population - Male", "Total Population - Female"), ]

# plot
p1<- ggplot() +
    geom_point(data=df, aes(x = Year, y = Value, colour = Element),
        size = 3, alpha = 0.7) +
    geom_line() +
    scale_color_manual(
        values = c("Total Population - Both sexes" = "orange", "Total Population - Male" = "blue", "Total Population - Female" = "red"),
        labels = c("Total Population", "Male", "Female")
                        ) +
    scale_x_continuous(n.breaks = 10) +
    theme(
        legend.position = "bottom",
        legend.justification = c(0, 0),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 13),
        plot.title = element_text(size = 14),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        axis.text.x = element_text(face = 3, color = "black",
            size = 12, angle = 0),
        axis.text.y = element_text(face = 3, color = "black",
            size = 12, angle = 0),
        ) +
    labs(
        title = "Population dynamics in Martinique for 1950-2023",
        subtitle = "Data: FAO",
        y = "Persons",
        x = "Year",
        color = "Social data:")
p1

#--------------- genders ------------------<

# ------------- urban-rural ------------>
df <- read_csv("Tab_1_Population_1950_2023.csv")
#head(df)

df <- df[, c("Element", "Year", "Value")]
#print(df)

#df <- df[df$Element %in% c("Rural population", "Urban population"), ]
df1 <- df[df$Element %in% "Rural population", ]
df2 <- df[df$Element %in% "Urban population", ]

p2<- ggplot() +
geom_point(data=df1, aes(x = Year, y = Value, colour = Value),
        size = 3, alpha = 0.8)  +
geom_point(data=df2, aes(x = Year, y = Value, colour = Value),
        size = 3, alpha = 0.9)  +
scale_colour_gradientn(colours = as.vector(turbo(100))) +
#scale_colour_gradientn(colours = as.vector(jet(100))) +
#scale_colour_gradientn(colours = as.vector(parula(100))) +
#geom_point(size = 0.1) +
    geom_line() +
    scale_x_continuous(n.breaks = 10) +
    theme(
        legend.position = "right",
        legend.justification = c(0, 0),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 13),
        plot.title = element_text(size = 14),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        axis.text.x = element_text(face = 3, color = "black",
            size = 12, angle = 0),
        axis.text.y = element_text(face = 3, color = "black",
            size = 12, angle = 0),
    ) +
    labs(
        title = "Population share in Martinique for 1950-2023",
        subtitle = "Data: FAO",
        y = "Persons",
        x = "Year"#,
#        color = "Social data:"
        )
p2
