library(shiny)
library(shinydashboard)
ui<-dashboardPage(
  dashboardHeader(title = "Poisson Distribution",
                  dropdownMenu(type = "message",
                               messageItem(
                                 from = "sales Dept",
                                 message = "Sales are steady this month."
                               ),
                               messageItem(
                                 from = "New User",
                                 message = "How do I register?",
                                 icon = icon("question"),
                                 time = "13:45"
                               ),
                               messageItem(
                                 from = "Support",
                                 message = "The new server is ready,",
                                 icon = icon("life-ring"),
                                 time = "2014-12-01"
                               )
                         ),

                  dropdownMenu(type = "notifications",
                               notificationItem(
                                 text = "5 new users today",
                                 icon("users")
                               ),
                               notificationItem(
                                 text = "12 items delivered",
                                 icon("truck"),
                                 status = "success"
                               ),
                               notificationItem(
                                 text = "Server load at 86%",
                                 icon = icon("exclamation-triangle"),
                                 status = "warning"
                               )
                               ),
                  dropdownMenuOutput("messageMenu")
                  ),

  dashboardSidebar(
    sidebarMenu(
    
      menuItem("Dashboard",tabName = "dashboard",
               icon = icon("dashboard")),
      menuItem("Widgets",tabName = "widgets",
               icon = icon("th"), badgeLabel = "new", badgeColor = "green")
               ),
      menuItem("Source code", icon = icon("file-code-o"),
               href = "https://github.com/rstudio/webinars"),
      sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                        label = "search..."),
      sliderInput("slider","Slider inputs", 1, 100, 50),
      textInput("text","Text input:")
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
    fluidRow(
      box(width = 8,
          title = "Histogram", status = "primary", solidHeader = TRUE,
          collapsible = TRUE,
          plotOutput("disPlot",height = 250)),
      box(width = 4,
      dropdownMenu(type = "tasks",badgeStatus = "success",
               taskItem(value = 90, color = "green",
                        "Documentation"
                        ),
               taskItem(value = 17, color = "aqua",
                        "Project x"
                        ),
               taskItem(value = 75, color = "yellow",
                        "Server deployment"
                        ),
               taskItem(value = 80, color = "red",
                        "Overall project"
                        )
               ))
    )
  ),
  tabItem(tabName = "widgets",
          h2("widgets tab contents")
          )
    )
  )
)
