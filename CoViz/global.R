library(shiny)
library(plotly)
library(leaflet)
library(dplyr)


covid <- read.csv("data/cases-brazil-cities.csv")

RMR <- covid[covid$name_RegiaoDeSaude=="Recife",]
RMR_cities <- RMR[,c(3,7:10)]

RMR_cities$city <- gsub("/PE","",RMR_cities$city)
RMR_cities$lat <- c( -7.91014,-7.78852, -8.28744,-8.02044,
                     -8.23255,-8.00152,-3.84036,-8.0024,-7.83437,
                     -7.75, -8.40012,-7.77693,-8.11208,-8.11777,
                     -8.00937,-7.94009, -8.14161,-8.05428,-8.00352,-8.11389)
RMR_cities$lng <- c(-34.9033,-35.0918,-35.0353,-34.9817,-35.4619,
                    -35.2143,-32.4113,-35.2933,-34.9064,-34.85,-35.0643,
                    -34.8924,-35.0154,-35.0931,-34.8553,-34.8723,-35.3963,
                    -34.8813,-35.0214,-35.2915)
RMR_cities$popupRMR <- paste(RMR_cities$city," <br> Total Cases: ", 
                             as.character(RMR_cities$totalCases),
                             " <br> Total Deaths: ", 
                             as.character(RMR_cities$deaths),
                             " <br> Deaths per 100K inhabitants: ", as.character(round(RMR_cities$deaths_per_100k_inhabitants,2)))

covid_recife <- read.csv("data/cases-recife.csv")
covid_recife$date <- as.Date(covid_recife$date)
covid_recife$city <- as.factor(covid_recife$city)

