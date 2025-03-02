# Load libraries
library(readxl)
library(ggplot2)
library(reshape2)

# File path
file_path <- 'C:/Users/user/Desktop/Projects/Iceland/Data.xlsx'

# Read data
data <- read_excel(file_path)

# Extract columns
years <- data$Year
gdp <- data$GDP
unemployment <- data$UE
debt <- data$Debt
exchange <- data$Exchange

# Scale unemployment for visibility
unemployment_scaled <- unemployment * 10

# Combine data for plotting
data_melted <- melt(data, id.vars = 'Year', measure.vars = c('GDP', 'Debt', 'Exchange', 'UE'))
data_melted$Unemployment_Scaled <- ifelse(data_melted$variable == 'UE', data_melted$value * 10, NA)

# Plot GDP
p <- ggplot(data, aes(x = years)) +
  geom_line(aes(y = gdp, color = 'GDP')) +
  geom_line(aes(y = debt, color = 'Debt % of GDP')) +
  geom_line(aes(y = exchange, color = 'Exchange Rate')) +
  geom_line(aes(y = unemployment_scaled, color = 'Unemployment (x10)'), linetype = 'dashed') +
  labs(x = 'Year', y = 'Indicators', title = 'Iceland Economic Indicators') +
  scale_color_manual(values = c('blue', 'green', 'yellow', 'red')) +
  theme_minimal()

# Show plot
print(p)
