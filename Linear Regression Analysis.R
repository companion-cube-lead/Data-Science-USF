head(iris, 4)

install.packages("dplyr")

install.packages("ggpubr")

install.packages("formattable")

#strictly speaking, you do not need to show these in your analysis


library(formattable)

library(dplyr)

library(ggpubr)

my_iris_dataframe <- data.frame(iris)

levels(my_iris_dataframe$Species)

head(my_iris_dataframe, 2)

str(my_iris_dataframe)

summary(my_iris_dataframe)

filter(my_iris_dataframe,Species=="virginica")

my_flower_table <- filter(my_iris_dataframe,Species=="virginica")

count(my_flower_table)

filter(my_iris_dataframe,Species=="virginica") %>%
  count() 

select(my_iris_dataframe, Sepal.Length, Sepal.Width, Species) %>%
  filter(Species=="virginica" & Sepal.Length<6 & Sepal.Width<=2.7)

head(arrange(my_iris_dataframe, Sepal.Length, desc(Sepal.Width)), 8)


my_iris_dataframe %>%
  group_by(Species) %>%
  summarise (
    mean_petal_length =  mean(Petal.Length),
    mean_sepal_length = mean(Sepal.Length),
    median_sepal_width = median(Sepal.Width),
    median_pedal_width = median(Petal.Width)
  )


complex_query <- my_iris_dataframe %>%
  group_by(Species) %>%
  summarise (
    mean_petal_length =  mean(Petal.Length),
    mean_sepal_length = mean(Sepal.Length),
    median_sepal_width = median(Sepal.Width),
    median_pedal_width = median(Petal.Width)
  )


formattable(complex_query)

library(ggpubr)

plot_species_length <- ggviolin(my_iris_dataframe,
                                x = "Species",
                                y = "Sepal.Length",
                                fill = "Species",
                                palette = c("#00AFBB", "#E7B800", "#FC4E07"),
                                add = "boxplot", add.params = list(fill='white')
)


plot_species_length

compare_species <- list( c("setosa", "versicolor"), c("setosa", "virginica"))

plot_species_length + stat_compare_means(comparisons = compare_species, label = "p.signif")


my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")  
pairs(iris[,1:4], pch = 19,  cex = 0.5,
      col = my_cols[iris$Species],
      lower.panel=NULL)

my_cols


#Linear Regression Model Analysis

#At first we decided to use some of the code and analysis learned from our last meeting to get see if there is any relationship through a visualization. We also observed the means to make comparisons to see if there were any conclusions we can draw from this.


complex_query <- my_iris_dataframe %>%
  group_by(Species) %>%
  summarise (
    mean_petal_length =  mean(Petal.Length),
    mean_sepal_length = mean(Sepal.Length),
    median_sepal_width = median(Sepal.Width),
    median_pedal_width = median(Petal.Width)
  )

# you used my code, but how does it serve your analysis? 
# Maybe give me all the possible measures of center for the groups
# ^ what's a clever way to do this with a general function? 




formattable(complex_query)


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

#only petal length and sepal length?

ggp4 <- ggplot(my_iris_dataframe, aes(x = Petal.Length, y = Sepal.Length)) + 
  geom_point(col = "#009E73", size = 2.5) + 
  ggtitle("Iris Dataframe Sepal Length Vs. Petal Length") + 
  stat_smooth(method = 'lm', se = FALSE)

ggp4

# a few things:
# You guys will be presenting this, I want nudge you towards using rmarkdown to present your results
# You're getting familiar the the grammar of graphics, and that's good. Now using your knowledge of regression.. (cont. below)
# You'll need to fulfill certain assumptions when you fit the model 
# In other words, we need metrics (residual plots), model report etc..
# Finally, make sure to fit your final model using CARET (learn why using test, train, validate mean in the machine learning lingo)
# more boxplots :) look at the ggpubr guides online 
# In summary, we need more! but this is headed in the right direction



