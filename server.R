library(shiny)
library(ggplot2)

dataset <- diamonds

function(input, output) {
  
  model1 <- lm(price ~ carat, data = dataset)
  
  model1pred <- reactive({
    caratInput <- input$slidercarat
    predict(model1, newdata = data.frame(carat = caratInput))
  })
  
  output$plot1 <- renderPlot({
    
    caratInput <- input$slidercarat
    
    plot(dataset$carat, dataset$price, xlab = "carat", ylab = "Price", 
         pch=16, xlim = c(0, 6), ylim = c(200, 19000))
    if(input$showModel1){
      abline(model1, col="red", lwd=2)
    }
    
   legend(25,250, "Model 1 Prediction", pch=16, col = "red", bty="n", cex=1.2) 
   points(caratInput, model1pred(), col="red", pch=16, cex=2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
}