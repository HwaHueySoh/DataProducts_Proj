library(shiny)
library(data.table)
require(rCharts)
library(GGally)
library(ggplot2)
library(Hmisc)
library(dplyr)
library(stringi)
library(markdown)

#load data
data(swiss)

#list indicators, save dependent variable, Fertility
indicators <<- sort(names(swiss)[-1])

shinyServer(
  
  function(input,output) {
    newdata <- reactive({
      temp <- select(swiss, Fertility, input$indicator)
      temp
    })
    
    output$indicatorInput  <- renderUI({
      checkboxGroupInput('indicator', 'Socioeconomic Indicators:', indicators, selected="Agriculture")
    })
    
    output$pairplot <- renderPlot({
      newswiss <- newdata()
      
      stitle <- "Fertility against Selected Socioeconomic Indicators"
      ggpairs(newswiss, lower = list(continuous = "smooth"), params = c(method = "loess"))
    })
    
    output$coefficients <- renderUI({
      newswiss <- newdata()
      fit <- lm( Fertility ~ ., data = newswiss)
      
      summary(fit)$coeff
    })
  
  }
  
  
  
  
  
  )