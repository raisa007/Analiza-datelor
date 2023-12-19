install.packages('openintro')
install.packages('tidyverse')

library(tidyverse)
library(openintro)
# Load the required library
library(ggplot2)
library(readr)

# Set the path to the CSV file
file_path <- "C:/Users/bater/Desktop/consumerism_transposed.csv"

# Read the data from the CSV file
data <- read_csv(file_path)
set.seed(123) # For reproducibility of random data
data <- data.frame(
  Year = seq(2005, 2022, by = 0.5),
  CO2_Emissions = runif(35, min = 2.5, max = 3.5),
  Fertility_Rate = runif(35, min = 1.25, max = 2.75),
  Waste_Collected = runif(35, min = 2600, max = 3200),
  Meat_Consumption = runif(35, min = 40, max = 60)
)

# Melting the data for use with ggplot2
library(reshape2)
data_melted <- melt(data, id.vars = 'Year')

# Creating the plot
p <- ggplot(data_melted, aes(x = Year, y = value)) +
  geom_line() +
  facet_wrap(~variable, scales = 'free_y', ncol = 1) +
  theme_minimal() +
  labs(x = 'Year', y = NULL) +
  theme(axis.title.y = element_blank())

# Printing the plot
print(p)