library(shiny)

# Load the 'datasets' package which contains 'VADeaths' dataset
library(datasets)

# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("Death Rate Analysis in Virginia in 1940 by Population Group"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with input to select the population group
            sidebarPanel(
                selectInput("population_group", "Population Group:", choices=colnames(VADeaths)),
                hr(),
                helpText("This shiny app shows the death rates in Virginia, USA in 1940 by age group on the selected population group."),
                hr(),
                helpText("The source code can be found at https://https://github.com/tshah-ucl/developing-data-products")
            ),
            
            # Create the bar graph
            mainPanel(
                plotOutput("deathPlot"),
                h3('Total number of deaths in the chosen population group:'),
                verbatimTextOutput("prediction")
            )
            
        )
    )
)