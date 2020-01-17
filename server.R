# load required packages and data
library(shiny)
library(dplyr)
suppressPackageStartupMessages(library(googleVis))
data(Population)

# build dataframe for creating plot
countries <- data.frame(Population$Country, Population$Population,
                        hover = paste0(Population$Country, ": ",
                                       formatC(Population$Population, big.mark = ","), " people ",
                                       "(Rank ", Population$Rank, ")", "; ",
                                       Population$`% of World Population`*100, "% of World Population"),
                        check.names = FALSE)
countries$hover <- as.character(countries$hover)

# define server logic required to draw the plot
shinyServer(function(input, output) {
    
    output$plot1 <- renderGvis({
        
        # rename slider values
        minpop <- input$population[1]
        maxpop <- input$population[2]
        
        # filter data using slider input
        plotdata <- countries %>% 
            filter(Population$Population>minpop, Population$Population<maxpop)
        
        # plot map
        gvisGeoChart(plotdata, 
                     locationvar="Population$Country", hovervar="hover",
                     options=list(width=800, height=600))
        
    })
    
})