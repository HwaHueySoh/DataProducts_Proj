library(shiny)
require(rCharts)
library(Hmisc)
library(dplyr)
library(markdown)
options(RCHART_LIB = 'highcharts')

shinyUI(pageWithSidebar(
  
  headerPanel("Observing 1888 Swiss Fertility Trends and Socioeconomic Indicators"),
  
  sidebarPanel(
    uiOutput("indicatorInput")
  ),
  
  mainPanel(tabsetPanel(
    
    tabPanel("About", includeMarkdown("README.md")),
    
    tabPanel("Fertility",
             h4("Choose the Socioeconomic Indicators on the left you want to model."),
             h2("Pairwise Plot"),
             plotOutput("pairplot", "auto"),
             h2("Linear Model Coefficients"),
             tableOutput("coefficients")
         
             )
    
    
    )
    
  )
  
  ))