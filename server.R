library(ggplot2)

nosim <- 10000
sim <- function(n) data.frame(variance = apply(matrix(sample(1 : 6, nosim * n, replace = TRUE), nosim), 1, var))

shinyServer(
    function(input, output) {
        output$plot <- renderPlot({
            dat <- sim(input$n)
            g <- ggplot(data = dat, aes(x = variance)) +
                geom_histogram(fill = I("blue"), col = I("red"), alpha = I(.5), binwidth = .2) +
                xlim(c(0, 6)) +
                geom_vline(xintercept = 2.92, size = 1.5) +
                xlab("Sample Distribution of the Variance of N Die Rolls")
            print(g)
        })
    }
)
