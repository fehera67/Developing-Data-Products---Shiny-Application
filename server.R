library(shiny)

mtcars$am <- factor(mtcars$am, labels = c("A", "M"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=mtcars)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(mtcars, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })

})
