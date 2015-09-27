#Titanic
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  shinyUI(navbarPage("TitanicApp",tabPanel("Predict"))),
    
  # Application title
  titlePanel("Would You Have Survived The Titanic?"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      p("Answer the following questions in order to predict if you would have survived the Titanic disaster!"),
      #Age
      sliderInput("age", "Age:", min = 1, max = 80, value = 30),
      #Gender
      radioButtons("gender", "Gender:", choices = list("Male" = "male", "Female" = "female"),selected = "male"),
      #Class
      selectInput("class", "Passenger Class", choices = list("1st" = 1, "2nd" = 2, "3rd" = 3), selected = 1),
      #Number of Siblings/Spouses Aboard
      sliderInput("sibsp", "Number of Siblings/Spouses Aboard:", min = 0, max = 8, value = 1),
      #Number of Parents/Children Aboard
      sliderInput("parch", "Number of Parents/Children Aboard", min = 0, max = 6, value = 1),
      #Port of Embarkation
      selectInput("port", "Port of Embarkation", choices = list("Cherbourg" = "C", "Queenstown" = "Q", "Southampton" = "S"), selected = "S"),
      p("When ready press the submit button to test your luck!"),
      submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("The sinking of the RMS Titanic"),
      img(src='titanic.jpg', align = "middle", width="50%"),
      br(),
      br(),
      tags$div(
        tags$p("The sinking of the RMS Titanic is one of the most infamous shipwrecks in history.  On April 15, 1912, during her maiden voyage, the Titanic sank after colliding with an iceberg, killing 1502 out of 2224 passengers and crew. This sensational tragedy shocked the international community and led to better safety regulations for ships."), 
        tags$p("One of the reasons that the shipwreck led to such loss of life was that there were not enough lifeboats for the passengers and crew. Although there was some element of luck involved in surviving the sinking, some groups of people were more likely to survive than others, such as women, children, and the upper-class."), 
        tags$p("The dataset for this shinny app was taken from the Kaggle competition: Titanic: Machine Learning from Disaster:"),
        tags$a("https://www.kaggle.com/c/titanic", target="_blank")
      ),
      h3("According to the data you entered:"),
      h5("*This process may take a couple of minutes, wait for the message to appear. Thanks!"),
      h1(textOutput("text1"))
    )
  )
))