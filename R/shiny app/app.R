# A hello world shiny app that consumes an API hosted on Connect. Thanks @brian-law-rstudio!
library(shiny)
library(httr)
library(tidyverse)

# Define UI for application
ui <- fluidPage(
  titlePanel("Heads you win, Tails you win!"),
  sidebarLayout(
    sidebarPanel(
      actionButton("action", label = "Flip!"),
      hr(),
      fluidRow(column(2, verbatimTextOutput("value")))),
    mainPanel(
        textOutput("coin")
       
    )
  )
)
# Server logic, go hit an api on RSC and get a coin flip result back
server <- function(input, output) {
  result <- eventReactive(input$action, {
    query_url <- "https://colorado.rstudio.com/rsc/coin_api/coin_toss"
    response <- GET(query_url) %>%
      content(as = "text") %>%
      jsonlite::fromJSON()
  })
  output$coin <- renderText(result())
}
# Run the application
shinyApp(ui = ui, server = server)# A hello world shiny app that consumes an API hosted on Connect
library(shiny)
library(httr)
library(tidyverse)
# Define UI for application
ui <- fluidPage(
  titlePanel("Heads you win, Tails you win!"),
  sidebarLayout(
    sidebarPanel(
      actionButton("action", label = "Flip!"),
      hr(),
      fluidRow(column(2, verbatimTextOutput("value")))),
    mainPanel(
      textOutput("coin")
    )
  )
)
# Server logic, go hit an api on RSC and get a coin flip result back
server <- function(input, output) {
  result <- eventReactive(input$action, {
    query_url <- "https://colorado.rstudio.com/rsc/coin_api/coin_toss"
    response <- GET(query_url) %>%
      content(as = "text") %>%
      jsonlite::fromJSON()
  })
  output$coin <- renderText(result())
}
# Run the application
shinyApp(ui = ui, server = server)