install.packages('dplyr')
install.packages('ggpubr')

library(dplyr)

library(ggpubr)

my_iris_dataframe <- data.frame(iris)



my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")  
pairs(iris[,1:4], pch = 19,  cex = 0.5,
      col = my_cols[iris$Species],
      lower.panel=NULL)

my_cols

#Visually we noticed there seemed to be a linear relationship between Petal.Length and Petal.Width

#We decided to do more analysis on each species individually in these respective areas.

#Setosa Analysis

setosaTable <- filter(my_iris_dataframe,Species=="setosa")

setosaTable

select(setosaTable, Petal.Length, Petal.Width, Species) %>%
 arrange(Petal.Length, Petal.Width)

summary(setosaTable)

ggp1 <- ggplot(setosaTable, aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point(col = "#00AFBB", size = 2.5) + ggtitle("Setosa") + 
  stat_smooth(method = 'lm', se = FALSE)

ggp1
# I see you made this plot to emphasize the linear relationship between these tow columns

# But the previous matrix gives us this plot as well, how does this serve your analysis of regression? 


#Versicolor Analysis

versicolorTable <- filter(my_iris_dataframe,Species=="versicolor")

select(versicolorTable, Petal.Length, Petal.Width, Species) %>%
  arrange(Petal.Length, desc(Petal.Width))

summary(versicolorTable)

ggp2 <- ggplot(versicolorTable, aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point(col = "#E7B800", size = 2.5) + ggtitle("Versicolor") + 
  stat_smooth(method = 'lm', se = FALSE)

ggp2

#Virginca Analysis

virginicaTable <- filter(my_iris_dataframe,Species=="virginica")

select(virginicaTable, Petal.Length, Petal.Width, Species) %>%
  arrange(Petal.Length, desc(Petal.Width))

summary(virginicaTable)

ggp3 <- ggplot(virginicaTable, aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point(col = "#FC4E07", size = 2.5) + ggtitle("virginica") + 
  stat_smooth(method = 'lm', se = FALSE)

ggp3

#Using R to Display Visual Analysis

install.packages('gridExtra')
library('gridExtra')

grid.arrange(ggp1, ggp2, ggp3, ncol = 3)

#this plot is cool, what patterns do we find here,
#what happens if we run the scatterplot against the other columns
# ^ this would effectively be the matrix I sent you guys

#lets go back to see if there is any other relationships

my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")  
pairs(iris[,1:4], pch = 19,  cex = 0.5,
      col = my_cols[iris$Species],
      lower.panel=NULL)

#We decided to do an analysis between petal length and sepal length.




############################
# box-plot: Sepal and petal with and lengths for each species
# We can see a hint of a linear relation for sepal.length, petal.lenght, petal.width vs all species
#We installed the caret package which contains functions to streamline
#the model training process for complex regression problems.
#CARET (short for Classification And REgression Training) 

install.packages("caret")
install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)
featurePlot(x = iris[, 1:4], 
            y = iris$Species, 
            plot = "box", 
            ## Pass in options to bwplot() 
            scales = list(y = list(relation="free"),
                          x = list(rot = 90)),  
            layout = c(4,1 ), 
            auto.key = list(columns = 2))

#To do the Train Function we will split 60% of the iris dataframe for testing
#and the rest of the 40% for validating the predictive model

split <- createDataPartition(y = my_iris_dataframe$Petal.Length, p = 0.6, list = FALSE)

#dev for development or testing (60%)

dev <- my_iris_dataframe[split,]

#val for validating (40%)

val <- my_iris_dataframe[-split,]

#We can now use the train function to test the model for Linear Regression

lmFit<-train(Petal.Length~., data = dev, method = "lm")

summary(lmFit)

lmFit


#We can also use caret fucntions for a residuals plot

residuals <- resid(lmFit)

predictedValues <- predict(lmFit)

plot(dev$Petal.Length,residuals)

abline(0,0)


#Variable Imprtance Plot

varImp(lmFit)

plot(varImp(lmFit))

#Corelation != Causation

cor(my_iris_dataframe[c(1:4)])

