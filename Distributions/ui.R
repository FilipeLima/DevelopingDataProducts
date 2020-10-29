#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Distribuição de Médias"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons("dist", "Tipo de Lançamento",
                         c("Moedas" = "coins",
                           "Dados" = "dice")
                         ),
            sliderInput("sim",
                        "Número de simulações",
                        min = 1,
                        max = 1000,
                        value = 100),
            sliderInput("amostra",
                        "Tamanho das amostras",
                        min = 1,
                        max = 100,
                        value = 1),
            h5("A amostra terá lançamentos independentes de moedas ou dados não viciados. Será retirada a média de cada amostra, e a distribuição dessas médias será mostrada ao lado. O número de simulações é a quantidade de amostras.")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
