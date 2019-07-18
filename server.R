#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste(input$variable," ~ mpg")
  })  
   

  fit <- reactive({
  lm(as.formula(formulaText()), data=mtcars)
})

  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgscatterplot <- renderPlot({
  ggplot(mtcars,aes_string(x = 'mpg',y = input$variable))+
      geom_point(aes(color = cyl),size = 4)+
      geom_smooth(method = 'lm')
})


  modelpred <- reactive({
    mpgInput <- input$sliderMPG
    predict(lm(as.formula(formulaText()), data=mtcars),newdata = data.frame(mpg = mpgInput))
  })
 
   output$pred <- renderText({
     modelpred()
   })
  
})
