#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict different variables given MPG"),
  
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderMPG","What is the MPG of the car?",
                   min = 10, max = 40, value = 15),
       selectInput("variable","Variable To Be Predicted:",
                   c("Displacement (cu.in.)" = "disp",
                     "Gross horsepower" = "hp",
                     "Weight (lb/1000)" = "wt",
                     "1/4 mile time" = "qsec"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tabsetPanel(type = "tabs",
                   tabPanel("Scatter Plot",br(),
                            plotOutput("mpgscatterplot")),
                   tabPanel("Regression Model",br(),
                            verbatimTextOutput("fit"),
                            h3("Prediction from linear model:"),
                            textOutput("pred")),
                   tabPanel("Data and App Detail",
                            h2("Motor Trend Car Road Tests"),
                            hr(),
                            h3("Description"),
                            helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                                     " and comprises fuel consumption and 10 aspects of automobile design and",
                                     " performance for 32 automobiles (1973-74 models).",
                                     " This is a data frame with 32 observations on 11 variables."),
                            h3("Source"),
                            helpText("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411."),
            
                            h2("Shiny App"),
                            hr(),
                            h3("Description"),
                            helpText("This app is to help predict the value of different variables from a given MPG,",
                                     " choose a mpg value and a variable to predict",
                                     " then by linear regression we can get a prediction.")))
    )
  )
))
