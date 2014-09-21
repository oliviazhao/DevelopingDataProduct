palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output, session) {
        
        # Combine the selected variables into a new data frame
        selectedData <- reactive({
                iris[, c(input$xcol, input$ycol)]
        })
        
        sampleData <- reactive({
                iris[sample(1:dim(iris)[1],input$samplesize),]
        })
        
        clusters1 <- reactive({
                kmeans(selectedData(), input$clusters)
        })
        
        clusters2 <- reactive({
                hclust(dist(sampleData()[,-5]), method="ave")
        }) 
        
        output$plot1 <- renderPlot({
                par(mar = c(5.1, 4.1, 0, 1))
                plot(selectedData(),
                     col = clusters1()$cluster,
                     pch = 20, cex = 3)
                points(clusters1()$centers, pch = 4, cex = 4, lwd = 4)
        })
        
        output$plot2 <- renderPlot({
                plot(clusters2(),
                     hang=-1,
                     labels=sampleData()$Species,
                     xlab="")  
                rect.hclust(clusters2(),k=input$clusters)
        })
        
})

