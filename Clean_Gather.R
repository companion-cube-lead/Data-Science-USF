library(readr)
library(tidyselect)
library(tidyverse)
library(ggpubr)
library(data.table)

Gradebook1 <- read_csv("Gradebook Quarter 1 2019.csv")


#Clean bad strings
head(Gradebook1)

quarter1 <-- data.frame(lapply(Gradebook1, function (x) {
  gsub("10:00 AM", "10 A", x )}))

Q1<--quarter1 %>% 
  mutate_all(funs(str_replace(., "9:00 AM", "9 A")))


as.numeric(gsub("([0-9]+).*$", "\\1", quarter1$Test.2))

grade_pcalc <- function(a){
  dataframe_tobemodified <- a[, 4:ncol(a)] # This works 
  
  new_dataframe <- lapply(dataframe_tobemodified, function (a) {
  as.numeric(gsub("([0-9]+).*$", "\\1", a))
  })
  new_dataframe <- as.data.frame(new_dataframe)
  

  return(new_dataframe)
  
}

Gradebook1_1 <- grade_pcalc(Gradebook1)

Students <- Gradebook1$Student


Gradebook1_1<- cbind(Students, Gradebook1_1 )
Gradebook1_1 <- Gradebook1_1[-c(10),] 
Gradebook1_1 <- gather(Gradebook1_1, "Assignment", "Grade", 2:44)


