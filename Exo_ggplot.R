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
data("diamonds")
diamonds

geom_contour_filled(mapping = aes(x=diamonds$color, y=diamonds$depth), data = diamonds)
geom_hex(mapping = aes(x=diamonds$color, y=diamonds$depth),data = diamonds,stat = "binhex",position = "identity",show.legend = TRUE,inherit.aes = TRUE)
geom_bar(mapping = aes(x = diamonds$carat,y=diamonds$price), data = diamonds, just = 0.5,width = NULL)

f <- ggplot(diamonds, aes(carat, price))
f + geom_hex(mapping = aes(x=color, y=depth),data = diamonds,stat = "binhex",position = "identity",show.legend = TRUE,inherit.aes = TRUE, col="red", pch=16)

library(ggplot2)

data("diamonds")

# Création d'un graphique avancé avec plusieurs dimensions
plot <- ggplot(diamonds, aes(x = carat, y = price, color = cut, size = depth, shape = clarity)) +
  geom_point(alpha = 0.6) +  # Ajout de points avec une transparence de 60%
  labs(
    title = "Analyse avancée des diamants",
    subtitle = "Relation entre le carat, le prix, la coupe, la profondeur et la clarté",
    x = "Carat",
    y = "Prix (USD)",
    color = "Qualité de la coupe",
    size = "Profondeur",
    shape = "Clarté"
  ) +
  theme_minimal() +  # Application d'un thème épuré
  scale_color_manual(values = c("Fair" = "red", "Good" = "blue", "Very Good" = "green", "Premium" = "purple", "Ideal" = "orange")) +
  scale_size_continuous(range = c(1, 5)) +  # Ajustement de la taille des points
  facet_wrap(~ cut) +  # Séparation en sous-graphiques par qualité de coupe
  theme(legend.position = "bottom", panel.grid.major = element_line(color = "grey90"))

# Affichage du graphique
print(plot)
              