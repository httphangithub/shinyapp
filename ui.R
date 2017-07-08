library(shiny)
library(ggplot2)

dataset <- diamonds

fluidPage(
  
  titlePanel("Price Predictor for Your Diamonds"),
  
  sidebarPanel(
    
    sliderInput('slidercarat', 'Your Carat Value', min=min(dataset$carat), max=max(dataset$carat),
                value=0.2, step=0.01),
    checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
    submitButton("Submit")
  ),
  
  mainPanel(
    plotOutput("plot1"),
    h3("Predicted Price from Model 1:"),
    textOutput("pred1")
  )
)