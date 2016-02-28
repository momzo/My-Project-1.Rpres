

library(datasets)
library(shiny)
library(shinydashboard)
library(ggplot2)
data("mtcars")

ui<-dashboardPage(
  dashboardHeader(title = "INTERACTIVE"),
  dashboardSidebar(),
  dashboardBody(
  basicPage(
  fluidRow(
    box(width = 8,
        title = "Interactive", status = "primary", solidHeader = TRUE),
    column(width = 6,
           plotOutput("scatter1",
                      brush = brushOpts(id ="brush")
                      )
           ),
    box(width = 8,
        title = "Interactive", status = "primary", solidHeader = TRUE),
    column(width = 6,
           plotOutput("scatter2")
           )
  )
)
)
)


server<-function(input, output){
  output$scatter1<-renderPlot({
    ggplot(mtcars, aes(disp, hp)) +
      geom_point(size =3, shape =21, fill ="white", colour ="black") +
      theme_bw(base_size = 16)
  })
  
  output$scatter2<-renderPlot({
    brushed<-brushedPoints(mtcars, input$brush)
    ggplot(mtcars, aes(wt, mpg)) +
      geom_point(size =3, shape =21, fill ="white", colour ="black") +
      geom_point(data = brushed, colour ="#4488ee",size =3) +
      theme_bw(base_size = 16)
  })
  
}