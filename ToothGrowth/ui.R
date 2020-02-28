library(shiny)
library(tidyverse)
library(caret)

shinyUI(fluidPage(
    titlePanel("Predicting the Effect of Vitamin C Supplements on Tooth Growth in Guinea Pigs"),
    sidebarLayout(
        sidebarPanel(
            helpText("Using a linear regression model, this App
                 predicts the increase in the length of odontoblasts
                 in Guinea Pigs after receiving different doses of Vitamin C,
                 either in the form of Orange Juice or Ascorbic Acid."),
            sliderInput("dose",
                        "Choose Dosage Level:",
                        min = 0.4,
                        max = 2.1,
                        value = 1), 
        ),
        mainPanel(
            plotOutput("Plot"),
            h3("Predicted Tooth Growth:"), 
            tableOutput("pred")
        )
        
    )
))
