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
library(ggplot2)
library(readr)

# Replace with the path to your CSV file
file_path <- "your_file_path.csv"

data <- read_csv(file_path)

# Melt the data to long format for ggplot2
data_long <- reshape2::melt(data)

# Create histograms
p1 <- ggplot(data_long, aes(x = value)) +
  geom_histogram(bins = 30, fill = "turquoise4", color = "black") +
  facet_wrap(~variable, scales = 'free_x') +
  theme_minimal() +
  labs(x = NULL, y = "Count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Print the plot
print(p1)

