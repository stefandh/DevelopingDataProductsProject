# load shiny
library(shiny)

# define UI for application 
shinyUI(fluidPage(
    titlePanel("Population of Countries"),
    sidebarLayout(
        sidebarPanel(
            h3("Pick a Population Range"),
            h4("Use the slider to choose a maximum and minimum population 
               and the countries within that range will be highlighted. 
               You can hover over a country to see more detailed information."),
            sliderInput("population",
                        "people",
                        min = 0,
                        max = 1400000000,
                        value = c(0, 1400000000)),
        ),
        
        
        mainPanel(
            htmlOutput("plot1")
        )
    )
))