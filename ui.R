shinyUI(fluidPage(
    
    # Application title
    titlePanel("Sample Distribution of the Variance of N Die Rolls"),
    
    sidebarLayout(
        
        sidebarPanel(
            sliderInput('n', 'Select Number of Die Rolls (N) Per Simulation', value = 10, min = 10, max = 50, step = 10)
        ),
            
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot")
        )
    ),
    
    fluidRow(
        column(12,
            h2("Usage Guide"),
            helpText("This is a demonstration of how the variance of N die rolls becomes", 
                     "smaller as N increases (as you may recall from the Statistical Inference class)."),
            helpText("The theoretical variance of a die roll is 2.92.  This value is",
                     "indicated on the histogram as the vertical black line."),
            helpText("The histogram shows the distribution of the variance of N die rolls",
                     "repeated 10,000 times.  The sample variances are calculated as follows,",
                     "where 'nosim' = 10000 and 'n' = the value from the slider control above:"),
            code("apply(matrix(sample(1 : 6, nosim * n, replace = TRUE), nosim), 1, var)"),
            helpText("To change the value of N, move the slider to the right or left.",
                     "It takes a second or two to re-calculate the variances and re-draw the",
                     "histogram.  Notice how as N increases, the histogram of variance becomes narrower",
                     "indicating that the sample variance gets smaller as the number of",
                     "die rolls in the sample is increased.  Also notice that the distribution",
                     "of the variance of N die rolls is centered around the theoretical variance",
                     "of 2.92.  This shows that as we collect more data, the sample",
                     "variance is a good estimate of the population variance.")
        )
    )
))