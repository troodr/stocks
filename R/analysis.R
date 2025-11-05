#setwd("~/Documents/reports/stocks/")

#data <- read.csv("https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/data_2.csv")

summary(data)

print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Torgersen")$bill_length_mm), 2))
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Biscoe")$bill_length_mm), 2))
print(round(mean(subset(na.omit(data), species == "Adelie" & island == "Dream")$bill_length_mm), 2))


# Plot
penguins_clean <- na.omit(data)
plot(penguins_clean$bill_length_mm, penguins_clean$bill_depth_mm, type = "n", xlab = "Bill Length (mm)", ylab = "Bill Depth (mm)", main = "Penguin Bill Dimensions")
points(
  penguins_clean$bill_length_mm[penguins_clean$species == "Adelie"], penguins_clean$bill_depth_mm[penguins_clean$species == "Adelie"],
  col = "red", pch = 16
)
points(penguins_clean$bill_length_mm[penguins_clean$species == "Chinstrap"], penguins_clean$bill_depth_mm[penguins_clean$species == "Chinstrap"], col = "green", pch = 17)
points(penguins_clean$bill_length_mm[penguins_clean$species == "Gentoo"],
  penguins_clean$bill_depth_mm[penguins_clean$species == "Gentoo"],
  col = "blue", pch = 18
)
legend("topright",
  legend = unique(penguins_clean$species),
  col = c(
    "red",
    "green",
    "blue"
  ), pch = c(16, 17, 18)
)

library(tidyverse)
data %>%
  filter(!is.na(bill_length_mm), species == "Adelie") %>%
  summarise(mean_bill_length = mean(bill_length_mm)) %>%
  pull(mean_bill_length) %>%
  round(2)


# Read data using readr
data <- readr::read_csv("https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/data_2.csv")

# Summary
summary(data)

# Calculating mean billl length for different specieis and islands
data %>%
  filter(species == "Adelie") %>%
  group_by(island) %>%
  summarize(mean_bill_length = num(mean(bill_length_mm, na.rm = T), digits = 2))

# Plot using ggplot2
data %>%
  na.omit() %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species, shape = species)) +
  geom_point() +
  labs(x = "Bill Length (mm)", y = "Bill Depth (mm)", title = "Penguin Bill Dimensions") +
  scale_shape_manual(values = c("Adelie" = 16, "Chinstrap" = 17, "Gentoo" = 18))


library(styler)
styler::style_file("analysis.R")


download.file("https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/data_2.csv",destfile = "./input/data_2.csv",method = "curl")


library(tidyverse)
library(readxl)
# data <- read_excel("data.xlsx", sheet = "sheetNameOrNumber")
# data <- read_excel("data.xlsx", na = "-")


#data <- read_excel("data.xlsx", col_types = c("date", "skip", "guess", "numeric"))


data <- read_excel("input/data.xlsx", na = "NA")

# source the function

source(file = "R/functions.R")

cacl_mean_bill("Torgersen")
cacl_mean_bill("Biscoe")
cacl_mean_bill("Dream")


# Use the function in functions.R

create_scatterplot(data,"Adelie","Torgersen")







































