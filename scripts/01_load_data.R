library(readr)
url <- "https://catalog.ourworldindata.org/garden/covid/latest/compact/compact.csv"
covid_data <- read_csv(url)
head(covid_data)

