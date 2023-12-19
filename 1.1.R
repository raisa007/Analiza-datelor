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
=
# Example histogram plot for one variable
ggplot(data, aes(x = Medicamente)) +
  geom_histogram(binwidth = 250, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Medicamente continand alcool", x = "Medicamente continand alcool (tone)")

# If you want to create all histograms at once using facetting
# First, we'll need to reshape the data into a long format
library(tidyr)
data_long <- gather(data, key = "variable", value = "value")

# Then, create histograms using facet_wrap
ggplot(data_long, aes(x = value)) +
  geom_histogram(binwidth = 250, fill = "blue", color = "black", alpha = 0.7) +
  facet_wrap(~variable, scales = 'free_x') +
  theme_minimal() +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        strip.text.x = element_text(size = 8))

# Replace binwidth with an appropriate value for each variable
# You can determine this based on the range and distribution of your data
