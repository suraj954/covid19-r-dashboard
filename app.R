library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(plotly)
library(readr)

# Load cleaned dataset (already preprocessed)
covid_clean <- read_csv("data/covid_cleaned.csv", show_col_types = FALSE)

# Keep only real countries
covid_clean <- covid_clean %>%
  filter(!is.na(continent))

# Country list
countries <- sort(unique(covid_clean$country))

# Latest record per country
latest_data <- covid_clean %>%
  group_by(country) %>%
  slice_max(date, n = 1) %>%
  ungroup()

# Top 10 countries
top10 <- latest_data %>%
  arrange(desc(total_cases)) %>%
  slice(1:10)

ui <- dashboardPage(
  
  dashboardHeader(title = "COVID-19 Dashboard"),
  
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("chart-bar"))
    ),
    
    selectInput(
      "country",
      "Select Country",
      choices = countries,
      selected = "India"
    )
    
  ),
  
  dashboardBody(
    
    fluidRow(
      valueBoxOutput("total_cases"),
      valueBoxOutput("total_deaths")
    ),
    
    fluidRow(
      box(
        title = "COVID Cases Over Time",
        width = 12,
        plotlyOutput("casesPlot")
      )
    ),
    
    fluidRow(
      box(
        title = "Cases vs Deaths",
        width = 6,
        plotlyOutput("comparePlot")
      ),
      
      box(
        title = "Top 10 Countries",
        width = 6,
        plotlyOutput("topPlot")
      )
    ),
    
    fluidRow(
      box(
        title = "Global Distribution",
        width = 12,
        plotlyOutput("worldPlot")
      )
    )
    
  )
)

server <- function(input, output) {
  
  country_data <- reactive({
    covid_clean %>% filter(country == input$country)
  })
  
  output$total_cases <- renderValueBox({
    valueBox(
      format(max(country_data()$total_cases, na.rm = TRUE), big.mark = ","),
      paste("Total Cases in", input$country),
      icon = icon("virus"),
      color = "red"
    )
  })
  
  output$total_deaths <- renderValueBox({
    valueBox(
      format(max(country_data()$total_deaths, na.rm = TRUE), big.mark = ","),
      paste("Total Deaths in", input$country),
      icon = icon("skull"),
      color = "purple"
    )
  })
  
  output$casesPlot <- renderPlotly({
    
    p <- ggplot(country_data(), aes(date, total_cases)) +
      geom_line(color = "blue") +
      labs(
        title = paste("Cases Over Time -", input$country),
        x = "Date",
        y = "Total Cases"
      )
    
    ggplotly(p)
    
  })
  output$comparePlot <- renderPlotly({
  
  p <- ggplot(country_data(), aes(new_cases, new_deaths)) +
    geom_point(color = "darkred", alpha = 0.6) +
    geom_smooth(method = "lm", color = "blue") +
    labs(
      title = paste("Daily Cases vs Daily Deaths -", input$country),
      x = "New Cases",
      y = "New Deaths"
    )
  ggplotly(p)
  
  })
  
  output$topPlot <- renderPlotly({
    
    p <- ggplot(top10, aes(reorder(country, total_cases), total_cases)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      coord_flip() +
      labs(
        x = "Country",
        y = "Total Cases"
      )
    
    ggplotly(p)
    
  })
  
  output$worldPlot <- renderPlotly({
    
    plot_ly(
      data = latest_data,
      type = "choropleth",
      locations = ~code,
      z = ~total_cases,
      text = ~country,
      colorscale = "Reds"
    ) %>%
      layout(
        title = "Global COVID-19 Distribution",
        geo = list(showframe = FALSE)
      )
    
  })
  
}

shinyApp(ui, server)
