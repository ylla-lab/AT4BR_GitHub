#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(dplyr)
library(shiny)


# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        data("iris")
        selected_data<-iris %>% 
          dplyr::filter(Species=="setosa") 
        
        bins <- seq(min(selected_data$Sepal.Length), max(selected_data$Sepal.Length), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(selected_data$Sepal.Length, breaks = bins, col = 'darkred', border = 'grey',
             xlab = 'Sepal Length of iris setosa',
             main = 'Histogramlength')

    })

}
