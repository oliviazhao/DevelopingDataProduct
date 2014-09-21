library(shiny)

dataset <- iris

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Iris Data Clustering"),
        
        sidebarLayout(
                sidebarPanel(
                        selectInput('xcol', 'X Variable', names(dataset)[1:4], selected=names(iris)[[1]]),
                        selectInput('ycol', 'Y Variable', names(dataset)[1:4], selected=names(iris)[[2]]),
                        numericInput('clusters', 'Cluster count', 3, min = 1, max = 9),
                        numericInput('samplesize', 'Sample Size', 40, min=30, max=150),
                        helpText("Note: user can use this application to explore two clustering methods with iris dataset. ", 
                                 "Use the drop down lists to select what to plot on x and y axis for visualizing the k-means clustering result, ", 
                                 "input number of clusters to be calculated and choose the sample size for visualizing the hierarchical clustering result." 
                                )
                ),
                
                mainPanel(
                        tabsetPanel(type="tabs",
                                    tabPanel("K-means Clustering",plotOutput("plot1")),
                                    tabPanel("Hierarchical Clustering", plotOutput("plot2"))
                        )
                )
        )
))
