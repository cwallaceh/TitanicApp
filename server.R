#Titanic
library(shiny)
library(caret)
library(randomForest)
library(e1071)

# Define server logic required to draw a histogram
train <- read.csv("./data/data.csv", colClasses= c("integer","factor","factor","character","factor","numeric","integer","integer","character","numeric","character","factor"), na.strings=c("NA",""))

# Get only the relevant columns
train <- subset(train,select=c("Survived","Pclass","Sex","Age","SibSp","Parch","Embarked"))

#Train the model with a random forest
rf_model<-train(Survived~.,data=train,method="rf",preProcess="knnImpute",allowParallel=TRUE)

shinyServer(
  function(input, output) {
    
  output$text1 <- renderText({
    
    Pclass = as.factor(input$class)
    Sex = as.factor(input$gender)
    Age = as.numeric(input$age)
    SibSp = as.numeric(input$sibsp)
    Parch = as.numeric(input$parch)
    Embarked = as.factor(input$port)
    
    test <- data.frame(Pclass, Sex, Age, SibSp, Parch, Embarked)
    
    prediction <- predict(rf_model, test)
    
    if (prediction == 1) { "Congratulations! You Survived!" }
    else { "I'm sorry but chances are, you didn't make it :(" }
  })
})