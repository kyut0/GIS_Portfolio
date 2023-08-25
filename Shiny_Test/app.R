library(shiny)
library(shinydashboard)


ui <- navbarPage(
  "Page title",   
  tabPanel("panel 1", "one", tags$img(src="penguinFig1.jpg")),
  tabPanel("panel 2", "two"),
  tabPanel("panel 3", "three"),
  navbarMenu("subpanels", 
             tabPanel("panel 4a", 
                      "four-a",
                      tags$img(src="11102022_PM_Water_Cut_Katie.jpeg"),
                      tags$img(src="penguinDash.png"),
                      tags$img(src="penguinFig1.jpg"),
                      plotOutput("test4a")),
             tabPanel("panel 4b", 
                      "four-b"),
             tabPanel("panel 4c", 
                      "four-c")
  )
)

server <- function(input, output, session) {
  output$test4a <- 
    # renderPlot(
    #   plot(x=1:10, y=1:10)
    # )
    renderImage({
    list(src="Alberti.png",
         width="500px")
    }, deleteFile = F)
}

shinyApp(ui = ui, server = server)