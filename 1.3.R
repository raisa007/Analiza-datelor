# Load the required library
library(ggplot2)
library(readr)

# Set the path to the CSV file
file_path <- "C:/Users/bater/Desktop/consumerism_transposed.csv"

# Read the data from the CSV file
data <- read_csv(file_path)

# Assuming your data has columns for Year and each product category
# For example, let's assume these are the column names in your CSV:
# Year, Medicamente, ProvVitamine, Uleiuri

# Convert the data to long format for ggplot
library(tidyr)
data_long <- gather(data, key = "Product", value = "Consumption", -Year)

# Plot the data
ggplot(data_long, aes(x = Year, y = Consumption, color = Product, group = Product)) +
  geom_line() +
  geom_point() +
  scale_color_manual(values = c("Medicamente" = "blue", 
                                "ProvVitamine" = "orange", 
                                "Uleiuri" = "green")) +
  theme_minimal() +
  labs(title = "Evoluția consumului de produse pe ani", 
       x = "Anul", 
       y = "Consum (tone)",
       color = "Legend") +
  theme(legend.title = element_text(size = 10), 
        legend.position = "bottom")
