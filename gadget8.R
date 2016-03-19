

lmGadget<-function(data, xvar,yvar){
  library(shiny)
  library(miniUI)
  library(ggplot2)
  library(shinydashboard)
  
  
  ui<-miniPage(
    gadgetTitleBar("Interactive lm"),
    miniContentPanel(
      ## The parameter flex determines how space should be distributed
      ## to the cells.Can be a space;or use a vector of numbers to 
      ## specify the proportions.
      ## NA values will cause the corresponding cell to be sized
      ## according to its contents (without growing or shrinking)
      fillRow(flex = c(NA,1),
      fillCol(width = "100px",
              selectInput("degree", "Polynomial degree", c(1,2,3,4))
              ),
      plotOutput("plot1",
                 height = "100%",
                 click = "plot_click",
                 brush = brushOpts(
                   id = "plot_brush"
                   )
                 ),
      rstudioapi::askForPassword("please enter your password")
    )
  ),
  
  miniButtonBlock(
    actionButton("exclude_toggle","Toggle points"),
    actionButton("exclude_reset","Reset")
  
  )
)



server<-function(input,output){
  
  ## Use reactiveValues() to accumulate state
  
  vals<-reactiveValues(
    keeprows =rep(TRUE, nrow(data))
  )
  output$plot1<-renderPlot({
    req(input$degree)
    formula<-as.formula(paste0("y ~ poly(x, degree = ",input$degree, ")"))
    keep<-data[vals$keeprows, ,drop =FALSE]
    exclude<-data[!vals$keeprows, ,drop =FALSE]
    
    ggplot(keep, aes_string(xvar, yvar)) +
      geom_point(size = 3) +
      geom_smooth(method = lm, formula = formula, fullrange = TRUE, col = "gray50")+
      geom_point(data = exclude, fill =NA, color ="black", size =3, alpha =0.25)+
      coord_cartesian(xlim = range(data[[xvar]]), ylim = range(data[[yvar]]))+
      theme_bw(base_size = 14)
  })
  
  ## Toggle points that are brushed
  
  observeEvent(input$plot1_click, {
    res<-nearPoints(data, input$plot_click, allRows = TRUE)
    vals$keeprows<-xor(vals$keeprows, res$selected_)
  })
  
  observeEvent(input$exclude_toggle, {
    res<-brushedPoints(data, input$plot_brush, allRows = TRUE)
    vals$keeprows<-xor(vals$keeprows, res$selected_)
  })
  
  observeEvent(input$exclude_reset, {
    vals$keeprows<-rep(TRUE, nrow(data))
  })
  
  observeEvent(input$done, {
    formula<-as.fomula(paste0(yvar, "~ poly(", xvar, ", degree = ", input$degree, ")"))
    keep_data<-data[vals$keeprows, ,drop =FALSE]
    
    stopApp(
      list(
        data = keep_data,
        model = lm(formlua, keep_data)
        
      )
      
    )
    
  
  })

}

 runGadget(ui,server)
}

m<-lmGadget(mtcars, "wt","mpg")
m
