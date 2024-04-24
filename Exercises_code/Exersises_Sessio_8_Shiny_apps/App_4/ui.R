#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Iris setosa Sepal length"),

    # Sidebar with a slider input for number of bins
    fluidRow(
        column(width=4,
            sliderInput("bins",
                        "Number of bins:",
                        min = 0,
                        max = 10,
                        value = 2.5),
            selectInput("color1", 
                        "Select Color 1",
                        c("grey","darkblue","darkred", "darkorange")
                        )
        ),
        column(width=8,
          plotOutput("distPlot")
        )
    ),
    
    titlePanel("Iris virginca Sepal length"),
    
    fluidRow(
      column(width=4,
        sliderInput("bins_2",
                    "Number of bins:",
                    min = 0,
                    max = 10,
                    value = 2.5),
        selectInput("color2", 
                    "Select Color 1",
                    c("grey","darkblue","darkred", "darkorange")
        )
      ),
      column(width=8,
        plotOutput("distPlot_2")
      )
    )
)
