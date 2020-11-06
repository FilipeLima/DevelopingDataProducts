#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("CoViz - Covid-19 Data Visualization App"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
    checkboxGroupInput("cities", "Cities to be shown:",
                       unique(covid_recife$city),selected = "Recife")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type='tabs',
                        tabPanel("Cases", br(),plotlyOutput("Cases")),
                        tabPanel("Deaths", br(),plotlyOutput("Deaths")),
                        tabPanel("Cities Location",br(),leafletOutput("mymap")),
                        tabPanel("Documentation", br(),
                                 htmlOutput("doc"))
        )
    )
))
)