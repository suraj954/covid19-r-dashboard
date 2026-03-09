library(dplyr)
library(readr)

covid_clean <- covid_data %>%
  filter(!is.na(total_cases)) %>%
  filter(!is.na(total_deaths)) %>%
  filter(!is.na(new_cases))

# ---- OUTLIER DETECTION (IQR METHOD) ----

Q1 <- quantile(covid_clean$new_cases, 0.25, na.rm = TRUE)
Q3 <- quantile(covid_clean$new_cases, 0.75, na.rm = TRUE)

IQR_value <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

covid_clean <- covid_clean %>%
  filter(new_cases >= lower_bound & new_cases <= upper_bound)

# Save cleaned dataset
write_csv(covid_clean, "data/covid_cleaned.csv")

summary(covid_clean)
cat("Preprocessing completed\n")
cat("Rows after cleaning:", nrow(covid_clean), "\n")

