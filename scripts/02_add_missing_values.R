library(dplyr)

set.seed(123)

missing_rows <- sample(1:nrow(covid_data), 500)

covid_data$total_cases[missing_rows] <- NA

summary(covid_data)

