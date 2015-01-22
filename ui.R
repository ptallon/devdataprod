library(shiny)

shinyUI(ui=fluidPage(
    titlePanel("Body Mass Index (BMI) Calculator"),
    sidebarPanel(
        helpText("Body Mass Index (BMI) Is computed on the basis of an individual's 
                 height and weight. In pediatric cases, gender is taken into consideration in 
                 determining the positioning of BMI relative to others of a similar age and gender."),
        helpText("Please answer the following questions."),
        
        radioButtons(
            inputId = "units",
            label = "Units:",
            choices = c("Metric (kilos & meters)" = "Metric", "Imperial (lbs & inches)" = "Imperial"),
            selected = "Metric"
        ),
        
        numericInput(
            inputId = "height",
            label = strong("Your height:"),
            value = 1.60,
            step = 0.01
        ),
        
        numericInput(
            inputId = "weight",
            label = strong("Your weight:"),
            value = 50,
            step = 1
        ),
        
        selectInput(
            "age", "What age are you?",
            c("Over 18" = "Over 18",
              "Under 18" = "Under 18")),
        
        # Only show this panel if the person's age is under 18
        conditionalPanel(
            condition = "input.age == 'Under 18'",
            radioButtons(
                inputId = "gender",
                label = "Gender:",
                choices = c("Male" = "Male", "Female" = "Female"),
                inline=TRUE,
                selected = "Male"
            )      
        )
    ),
    mainPanel(    
        h4("Your BMI is calculated as:"),
        verbatimTextOutput("all_inputs"),        
        verbatimTextOutput("prediction"),
        h4("You may benchmark your BMI in the chart below:"),
        img(src = "http://our-mag.com/wp-content/uploads/2013/07/Standard-BMI-chart.png", width = "100%"),
        h6("Image source: http://our-mag.com/wp-content/uploads/2013/07/Standard-BMI-chart.png",align="center")
    )
))    