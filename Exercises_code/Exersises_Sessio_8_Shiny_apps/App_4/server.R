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
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        data("iris")
        selected_data<-iris %>% 
          dplyr::filter(Species=="setosa") 
        
        
        ggplot(selected_data, aes(x=Sepal.Length)) +
          geom_histogram(bins=input$bins, fill=input$color1 ) +
          theme_minimal()
        

    })
    
    
    output$distPlot_2 <- renderPlotly({
      
      # generate bins based on input$bins from ui.R
      data("iris")
      selected_data<-iris %>% 
        dplyr::filter(Species=="virginica") 
      
      Ggplot_to_plotly<-ggplot(selected_data, aes(x=Sepal.Length)) +
        geom_histogram(bins=input$bins_2, fill=input$color2 ) +
        theme_minimal()
      
      ggplotly(Ggplot_to_plotly)
      
    })

}
