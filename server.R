library(shiny)

library(datasets)

# PColor palette for the bar graph
colors = c("red", "dark green", "blue", "cyan", "purple")

# Server code to handle user's selection
shinyServer(function(input, output) {
    
    ##Total number of deaths for this population group
    output$prediction <- renderPrint({sum(VADeaths[,input$population_group]*1000)})
    
    # Create the plot
    output$deathPlot <- renderPlot({
        # Render a barplot
        barplot(VADeaths[,input$population_group], 
                main=input$population_group,
                ylab="Death Rate per 1000 population",
                xlab="Age Group",
                col=colors)
    })
})