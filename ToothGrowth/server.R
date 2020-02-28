library(shiny)
library(tidyverse)
library(caret)

shinyServer(function(input, output) {
    model <- lm(len ~ supp * dose, data = ToothGrowth)
    modelpred <- reactive({
        doseInput <- input$dose
        Prediction = predict(model, newdata = data.frame(supp = as.factor(c("OJ", "VC")), 
                                                         dose = doseInput))
        results = cbind(Supplement = c("Orange Juice (OJ)", "Ascorbic Acid (VC)"), Prediction)
    })
    
    output$Plot <- renderPlot({
        doseInput <- input$dose
        
        ToothGrowth %>% 
            ggplot(aes(dose, len)) + geom_point(aes(color = supp)) + 
            labs(x = "Dosage", y = "Length")
    })
    output$pred <- renderTable({
        modelpred()
    })
})
