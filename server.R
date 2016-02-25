library(shiny)
library(shinydashboard)

server<-function(input,output){
  
set.seed(122)
  
  histdata<-replicate(100,rpois(5,10))
  
  output$disPlot<-renderPlot({
    data<-histdata[,seq_len(input$slider)]
    hist(colMeans(data),col = "red")})
  
  output$searchText<-renderText({input$searchText})
  output$searchButton<-renderText({input$searchButton})
  
##  output$messageMenu<-renderMenu({
##    msgs<-apply(messageData, 1, function(row){
##      messageItem(from = row[["from"]], message = row[["message"]])
##    })
##    dropdownMenu(type = "message", .list = msgs)
##  })
##  output$ui<-renderUI({
##    if(is.null(input$text))
##      return()
##    "text" =textInput("dynamic", "Dynamic",
##                      value = "starting value") 
##  })
  
  
}
