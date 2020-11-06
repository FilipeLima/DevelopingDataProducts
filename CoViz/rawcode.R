covid_time <- read.csv("./Plotly/cases-brazil-cities-time.csv",encoding="UTF-8")
RMR_time <- covid_time[covid_time$name_RegiaoDeSaude=="Recife",]
RMR_time$city <- gsub("/PE","",RMR_time$city)
RMR_time <- RMR_time[,c(2,5,9:12)]
RMR_time$date <- as.Date(RMR_time$date)
RMR_time$city <- as.factor(RMR_time$city)
write.csv(RMR_time,file="cases-recife.csv",row.names = FALSE)
covid_recife <- read.csv("cases-recife.csv")
View(covid_recife)

setwd("C:/Users/Filipe/OneDrive - ufrpe.br/DataScience/Curso Johns Hopkins/DevelopingDataProducts/CoViz/CoViz")
covid_recife <- read.csv("cases-recife.csv")
unique(covid_recife$city)

covid_recife[covid_recife$city==cidades,]
covid_recife[covid_recife$city=="Recife",6]
cidades <- c("Recife", "Jaboatão dos Guararapes")
filter(covid_recife,city==cidades)

plot(covid_recife[covid_recife$city==cidades,][,1],covid_recife[covid_recife$city==cidades,][,6],xlim=c(1,200),type='l')
