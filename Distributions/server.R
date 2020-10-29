#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        if(input$dist=="coins"){
            data <- c(apply(matrix(sample(0 : 1,input$sim * input$amostra,
                                                     replace = TRUE),input$sim),1,mean))
        hist(data, breaks = 10, col = 'purple', border = 'black',
             main="Histograma da distribuição",xlab="Médias",ylab="Frequência")
        }
        if(input$dist=="dice"){
            data <- c(apply(matrix(sample(1 : 6, input$sim * input$amostra,
                                                     replace = TRUE), input$sim),1,mean))
            hist(data, breaks = 10, col = 'purple', border = 'black',
                 main="Histograma da distribuição",xlab="Médias",ylab="Frequência")
        }
    })

})
