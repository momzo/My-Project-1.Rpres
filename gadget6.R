
library(shiny)

ui<-basicPage(
  plotOutput("plot1", click = "plot_click", width = 400),
  verbatimTextOutput("info"),
  actionButton("done","Done")
)

server<-function(input,output){
  output$info<-renderPrint({
    row<-nearPoints(mtcars, input$plot_click,
                    xvar = "wt", yvar = "mpg",
                    threshold = 5, maxpoints = 1)
    cat("Nearest point within 5 pixels:\n")
    print(row)
  })

  vals<-reactiveValues(mtc = mtcars[, c("wt","mpg")])
  observeEvent(input$plot_click, {
    vals$mtc<-rbind(vals$mtc,
                    data.frame(wt = input$plot_click$x, mpg = input$plot_click$y)
                    )
  })
  
  output$plot1<-renderPlot({
    plot(vals$mtc$wt, vals$mtc$mpg)
    
  })
  
  observeEvent(input$done, {
    stopApp(vals$mtc)
  })
}