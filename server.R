library(shiny)

bmi <- function(units, weight, height, age, gender) {
    bmi = weight / height^2    
    if (units == "Imperial") {
        bmi = bmi * 703
    }    
    return (bmi)
}

shinyServer(
    function(input, output) {
        
        output$all_inputs <- renderText({ if(input$age == "Over 18") {
                                             paste0("Units:  ",input$units,
                                             "\n",
                                                 "Height: ",input$height,     
                                             "\n",
                                                 "Weight: ",input$weight,
                                             "\n",
                                                 "Age:    ", input$age,
                                             sep=" ") } 
                                          else {
                                              paste0("Units:  ",input$units,
                                                     "\n",
                                                     "Height: ",input$height,     
                                                     "\n",
                                                     "Weight: ",input$weight,
                                                     "\n",
                                                     "Age:    ", input$age,
                                                     "\n",
                                                     "Gender: ", input$gender,
                                                     sep=" ") 
                                          }                                         
                                        })
        
        output$prediction <- renderText({
            round(bmi(input$units, input$weight, input$height, input$age, input$gender),2)
            })                        
        
    }
)