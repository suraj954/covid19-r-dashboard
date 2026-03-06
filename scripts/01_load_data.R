# Load library
library(readr)

# Read dataset
covid <- read_csv("data/covid_data.csv")

# Preview dataset
head(covid)

# Structure of dataset
str(covid)

# Summary statistics
summary(covid)
