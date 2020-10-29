library(ggplot2)
sim <- 100
amostra <- 30
data <- data.frame(x=apply(matrix(sample(0 : 1, sim * amostra, replace = TRUE), sim),1,mean))
View(data)
g <- ggplot(data,aes(x=x))+geom_histogram(bins=10,fill="purple",colour="black")+geom_density(alpha=1,colour="orange")
g

