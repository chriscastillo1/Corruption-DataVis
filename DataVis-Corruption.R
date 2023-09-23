library(ggplot2)
library(data.table)

# Reads in csv file and assigns it to a Data Frame variable
df <- Economist_Assignment_Data

# For labeling countries on each point 
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")


# DATA & AES LAYER
plot <- ggplot(df, aes(x = CPI, y = HDI, color = Region)) +
  
  # Scattter Plot of Corruption and Human Development
  geom_point(size = 5, shape = 1) +
  
  # Adds a trend line to fit the data
  geom_smooth(aes(group = 1), method = 'lm', formula = y ~ log(x), se = F, color = 'red') +
  
  # Label each point as countries
  geom_text(aes(label = Country), color = 'gray20', data = subset(df, Country %in% pointsToLabel), check_overlap = TRUE) +
  
  # Adjusts X axis to go from 1 to 10  
  scale_x_continuous(limits = c(.9, 10.5), breaks = 1:10) +
  
  # Labels and Themes 
  labs(x = 'Corruption Perception Index', y = 'Human Development Index', title = 'Corruption and Human Development (2011)') +
  
  theme_economist_white()
  
print(plot)