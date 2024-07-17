
library(dplyr)
library(rpart)
library(rpart.plot)
IRIS <- read.csv('E:/Google data analytics/IRIS.csv')
str(IRIS)
head(IRIS)
  IRIS$species <- as.factor(IRIS$species)
distinct(IRIS)
outliers <- boxplot(IRIS$sepal_width, plot = FALSE)$out
IRIS_clean <- IRIS %>% filter(!sepal_width %in% outliers)
boxplot(IRIS_clean$sepal_width)
str(IRIS_clean)
table(IRIS_clean$species)
  model <- rpart(species ~ ., data = IRIS_clean, method = "class")
  rpart.plot(model)
  predictions <- predict(model, IRIS_clean, type = "class")
  new_data <- data.frame(
    sepal_length = 5.1,
    sepal_width = 3.5,
    petal_length = 1.4,
    petal_width = 0.2
  )
  
  predicted_species <- predict(model, new_data, type = "class")
  print(predicted_species)




