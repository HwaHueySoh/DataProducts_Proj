
library(GGally)

#load data
data(swiss)

#list indicators, save dependent variable, Fertility
indicators <<- sort(names(swiss)[-1])

shinyServer(
  
  function(input,output) {
    newdata <- reactive({
      if (length(input$indicator) < 1) {
        indicatorlist <- c("Fertility", "Agriculture")
      } else {
        indicatorlist <- c("Fertility", input$indicator)
      }
      temp <- swiss[,indicatorlist]
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
    
    output$coefficients <- renderTable({
      newswiss <- newdata()
      fit <- lm( Fertility ~ ., data = newswiss)
      
      summary(fit)$coeff
    })
  
  }
  
    
  )
