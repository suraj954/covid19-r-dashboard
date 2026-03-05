library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  dashboardHeader(title = "COVID-19 Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard")
    )
  ),
  
  dashboardBody(
    fluidRow(
      box(
        title = "Welcome",
        width = 12,
        "COVID-19 Data Analysis Dashboard Project"
      )
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui, server)

