
shinyServer(function(input, output) {
        output$mymap <- renderLeaflet({
                RMR_cities[,c(6,7)] %>% leaflet() %>% addTiles() %>%
                        addMarkers(popup=RMR_cities$popupRMR) %>%
                        addCircles(weight = 1, radius = sqrt(RMR_cities$totalCases_per_100k_inhabitants )*100)
        })
        

        output$doc <- renderUI(HTML("This app you will help you to understand the evolution of Covid-19 in the cities of the Recife Health Administrative Region. <br/>
                                    You have to select the cities in the sidebar. In the Cities Location tab you will find the location of each city within the State of Pernambuco in Brazil. Also, if you click in each marker you will have information related to Covid-19 in each city.<br/>
                                    In Cases tab you will find the evolution of infected cases, and in Deaths tab you will see the accumulated number of deaths.<br/>
                                    This app was based on this <a href ='https://filipelima.github.io/DevelopingDataProducts/Plotly/Covid19Data.html'> presentation</a>. Now, you can choose which city appears in the interactive plot."))
        output$Cases <- renderPlotly({
        if (!is.null({input$cities})){
            filtered_cities <- reactive({input$cities})
            covid_recife_filt <-reactive({filter(covid_recife,city==filtered_cities())})
            x <- reactive({
                covid_recife_filt()[,1]
            })
            y <- reactive({
                covid_recife_filt()[,6]
            })
            font <- list(
                family = "Courier New, monospace",
                size = 18,
                color = "#7f7f7f"
            )
            x_axis_config <- list(
                titlefont = font
            )
            y_axis_config <- list(
                title = "Total Cases",
                titlefont = font
            )
            plot1 <- plot_ly(covid_recife_filt(), x =x(), y =y(), 
                                 color = ~city, type = "scatter", mode = "lines")
            plot1 <- plot1 %>% layout(title="Covid-19 Cases evolution in Recife Health Administrative Region",
                                          xaxis = x_axis_config, yaxis = y_axis_config,
                                      legend = list(orientation = 'h'))
              
        } else{
            plot1 <- plotly_empty(type = "scatter", mode = "markers") %>%
                config(
                    displayModeBar = FALSE
                ) %>%
                layout(
                    title = list(
                        text = "You should select a city",
                        yref = "paper",
                        y = 0.5
                    )
                )
        }
        })
        output$Deaths <- renderPlotly({
            if (!is.null({input$cities})){
                filtered_cities <- reactive({input$cities})
                covid_recife_filt <-reactive({filter(covid_recife,city==filtered_cities())})
                x <- reactive({
                    covid_recife_filt()[,1]
                })
                y <- reactive({
                    covid_recife_filt()[,4]
                })
                font <- list(
                    family = "Courier New, monospace",
                    size = 18,
                    color = "#7f7f7f"
                )
                x_axis_config <- list(
                    titlefont = font
                )
                y_axis_config <- list(
                    title = "Total Deaths",
                    titlefont = font
                )
                plot1 <- plot_ly(covid_recife_filt(), x =x(), y =y(), 
                                 color = ~city, type = "scatter", mode = "lines")
                plot1 <- plot1 %>% layout(title="Covid-19 Deaths evolution in Recife Health Administrative Region",
                                          xaxis = x_axis_config, yaxis = y_axis_config,
                                          legend = list(orientation = 'h'))
                
            } else{
                plot1 <- plotly_empty(type = "scatter", mode = "markers") %>%
                    config(
                        displayModeBar = FALSE
                    ) %>%
                    layout(
                        title = list(
                            text = "You should select a city",
                            yref = "paper",
                            y = 0.5
                        )
                    )
            }
        })
})
