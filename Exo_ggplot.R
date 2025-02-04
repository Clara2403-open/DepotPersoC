# Exo ggplot

iris
hist(iris$Sepal.Length)
plot (iris$Petal.Length, iris$Petal.Width) # fonction générique en fonction de ce qu'on lui fournit en entrée
boxplot(iris$Petal.Length~iris$Species)

par(mfrow=c(1,2))
plot (iris$Petal.Length, iris$Petal.Width)
points(iris$Petal.Length[iris$Species== "setosa"], 
       iris$Petal.Width[iris$Species== "setosa"], 
       col="red", pch=16)
stripchart(iris$Petal.Length~iris$Species)

#ggplot2

install.packages("ggplot2")
library(ggplot2)

ggplot(data=iris, mapping = aes(x=Species, y=Sepal.Length,
                                fill=Species)) + 
  geom_boxplot()+
  theme_dark()

library(dplyr)
data("starwars")
starwars
data("diamonds")
diamonds

geom_contour_filled(mapping = aes(x=diamonds$color, y=diamonds$depth), data = diamonds)
geom_hex(mapping = aes(x=diamonds$color, y=diamonds$depth),data = diamonds,stat = "binhex",position = "identity",show.legend = TRUE,inherit.aes = TRUE)
geom_bar(mapping = aes(x = diamonds$carat,y=diamonds$price), data = diamonds, just = 0.5,width = NULL)

f <- ggplot(mpg, aes(diamonds$carat, diamonds$price))
f + geom_hex(mapping = aes(x=diamonds$color, y=diamonds$depth),data = diamonds,stat = "binhex",position = "identity",show.legend = TRUE,inherit.aes = TRUE)

