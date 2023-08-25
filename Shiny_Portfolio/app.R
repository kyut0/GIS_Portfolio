# Portfolio in Shiny Form
# Katy Yut
# August 19, 2023

RESUME <- "YutK_resume_dec2022_v2" # just the base file name, no extension
COVERLETTER <- "20230819_General_Cover_Letter"

# SETUP ========================================================================
# Load necessary packages
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(kableExtra)
library(tidyr)
library(tidyverse)
library(pdftools)

# Code for R coursework plot and table -----------------------------------------
# Assign variables
# sem <- c("Fall 2016", "Spring 2017", "Fall 2017", "Spring 2018", "Fall 2018", 
#          "Spring 2019", "Fall 2019", "Spring 2020", "Sum 2020", "Spring 2021")
# num <- c(0, 0, 0, 0, 1, 0, 2, 4, 1, 3)
# ord <- 1:10
# cum <- cumsum(num)
# 
# # Merge into dataframe
# df <- data.frame(ord, sem, num, cum)
# df$sem <- factor(df$sem, levels = df$sem[order(df$ord)])
# 
# # Assign variables
# name <- c("Econometrics", "Spatial Statistics", "Stats for Decision Making", 
#           "Advanced GIS/Spatial Analysis", "Managerial Econ II", "Geoinformatics Capstone Seminar", 
#           "Bayesian Econometrics", "Intro to Math Stats", "Text Analytics", "Advanced Applied Stats", "Research in Economic Problems")
# grade <- c("A", "A", "A", "A", "A", "A", "B", "A", "A", "A", "Pass")
# sem <- c("Fall 2018", "Fall 2019", "Fall 2019", "Spring 2020", "Spring 2020", "Spring 2020", 
#          "Spring 2020", "Summer 2020", "Spring 2021", "Spring 2021", "Spring 2021")
# 
# # Merge into dataframe
# df2 <- data.frame(name, grade, sem)

# Convert resume pdf to png ----------------------------------------------------
pngRes <- pdf_render_page(
  paste0(RESUME, ".pdf"),
  page = 1,
  dpi = 300
)
png::writePNG(pngRes, paste0(RESUME, ".png"))

# Convert cover letter pdf to png ----------------------------------------------
pngCL <- pdf_render_page(
  paste0(COVERLETTER, ".pdf"),
  page = 1,
  dpi = 300
)
png::writePNG(pngCL, paste0(COVERLETTER, ".png"))

# UI ===========================================================================
ui <- navbarPage(
  title = "Katy Yut - Geospatial Data Analyst",
  
  # Resume ---------------------------------------------------------------------
  tabPanel(title = "Resume", 
           fluidPage(
             downloadButton("downloadResume", ""),
             imageOutput("Resume_pdfimage")
           )
  ),
  
  # Cover letter ---------------------------------------------------------------
  tabPanel(title = "Cover Letter",
           fluidPage(
             downloadButton("downloadCoverLetter", ""),
             imageOutput("CoverLetter_pdfimage")
           )
  ),
  
  # References -----------------------------------------------------------------
  tabPanel(title = "References",
           fluidPage(
             h1("References"),
             h4("The following individuals are happy to vouch for my character and data analysis capabilities:"),
             
             fluidRow(
               column(1, tags$img(src="Katie_Smye.jpg", height="200px", style="vertical-align:middle")),
               column(width=8, offset=3,
                      p(h3("1. ", tags$a("Dr. Katie Smye", href="https://www.linkedin.com/in/katie-smye/")),
                        h4(a("Bureau of Economic Geology", href="https://www.beg.utexas.edu/"), "| Research Scientist"),
                        a("katie.smye@beg.utexas.edu", href="katie.smye@beg.utexas.edu"), " | (512)-471-6775"),
                      tags$img(src="UTBEGlogo_large.jpg", height="50px")
               )
             ), br(), 
             
             fluidRow(
               column(1, tags$img(src="Brent_Sams.jpg", height="200px")),
               column(width=8, offset=3,
                      p(h3("2. ", tags$a("Dr. Brent Sams", href="https://www.linkedin.com/in/brent-sams/")),
                        h4(a("E. & J. Gallo Winery", href="https://www.gallo.com/"), "| Viticulture Research Scientist"),
                        a("sams.brents@gmail.com", href="sams.brents@gmail.com"), " | (209) 568-9317"),
                      tags$img(src="EJGallo.jpg", height="50px")
               ),
             ), br(),
             
             fluidRow(
               column(1, tags$img(src="Kirsten_deBeurs.jpg", height="200px")),
               column(width=8, offset=3,
                      p(h3("3. ", tags$a("Dr. Kirsten de Beurs", href="https://www.linkedin.com/in/kirsten-de-beurs-a78275102/?originalSubdomain=nl")),
                        h4(a("Wageningen University", 
                             href="https://www.wur.nl/en/persons/kirsten-prof.dr.-km-kirsten-de-beurs.htm"), 
                           "| Chair & Professor"),
                        a("kdebeurs@gmail.com", href="kdebeurs@gmail.com"), " | +3 (131) 748-2219"),
                      tags$img(src="WUR.jpg", height="50px")
               ),
             ), br()
           )
           
           # NO PICTURES:-------------------------------------------------------
           # fluidPage(
           #   h1("References"),
           #   h4("The following individuals are happy to vouch for my character and data analysis capabilities:"),
           #   p(h3("1. ", tags$a("Dr. Katie Smye", href="https://www.linkedin.com/in/katie-smye/")),
           #     h4(a("Bureau of Economic Geology", href="https://www.beg.utexas.edu/"), "| Research Scientist"),
           #     a("katie.smye@beg.utexas.edu", href="katie.smye@beg.utexas.edu"), " | (512)-471-6775"),
           #   
           #   br(), 
           
           #   p(h3("2. ", tags$a("Dr. Brent Sams", href="https://www.linkedin.com/in/brent-sams/")),
           #     h4(a("E. & J. Gallo Winery", href="https://www.gallo.com/"), "| Viticulture Research Scientist"),
           #     a("sams.brents@gmail.com", href="sams.brents@gmail.com"), " | (209) 568-9317"),
           #   
           #   br(),
           #   
           #   h3("3. ", tags$a("Dr. Kirsten de Beurs", href="https://www.linkedin.com/in/kirsten-de-beurs-a78275102/?originalSubdomain=nl")),
           #   h4(a("Wageningen University", 
           #        href="https://www.wur.nl/en/persons/kirsten-prof.dr.-km-kirsten-de-beurs.htm"), 
           #      "| Chair & Professor"),
           #   a("kdebeurs@gmail.com", href="kdebeurs@gmail.com"), " | +3 (131) 748-2219",
           # )
  ),
  
  # Past Work ------------------------------------------------------------------
  navbarMenu("Sample Work",
             tabPanel("Bureau of Economic Geology",
                      h1("Bureau of Economic Geology"),
                      h3(tags$i("May 2023 - current")),
                      
                      tags$img(src="10062022_PM_All_Wells_Completion_Date_Tim.jpeg", width="90%"),
                      p(tags$b("Figure 1:"), "Map of all wells drilled in the 
                      Permian Basin region, colored by decade completed. 
                        Created in ArcMap using data from S&P Global Enerdeq."),
                      
                      tags$img(src="11102022_PM_Water_Cut_Katie.jpeg", width="90%"),
                      p(tags$b("Figure 2:"), "Map of total horizontal lateral 
                      length drilled, in feet, for all horizontal wells in 
                      Delaware, Midland, and Haynesville, aggregated on square mile blocks. 
                        Created in ArcMap using data from S&P Global Enerdeq."),
                      
                      tags$img(src="11152022_MB_DB_HV_Drilling_Intensity_ByLen_Katy.jpg", width="90%"),
                      p(tags$b("Figure 3:"), "Map of Water Cut (Produced Water / (Produced Oil + Produced Water)) 
                      for all horizontal wells in the Permian Basin, aggregated on square mile blocks. 
                        Created in ArcMap using data from S&P Global Enerdeq.")
             ), 
             tabPanel("E. & J. Gallo Winery",
                      h1("E. & J. Gallo Winery"),
                      h3(tags$i("June 2020 - December 2020")),
                      
                      tags$img(src="WorldGrapeProduction.png", width="90%"),
                      p(tags$b("Figure 1:"), "World map of grape production by country. 
                        Map requested and produced within one business day. Created in QGIS."),
                      
                      tags$img(src="Alberti.png", width="90%"),
                      p(tags$b("Figure 2:"), "Kriging interpolated Brix (i.e., grape sugar content) 
                        values for 2017, 2018, and 2019 across a single block with 
                        sampling algorithm solutions for both Landsat and Sentinel 
                        imagery. Created in QGIS.")
             ),
             tabPanel("NASA",
                      h1("NASA DEVELOP"),
                      h3(tags$i("May 2019 - August 2019")),
                      
                      h2("Forecasting Red Spruce Restoration Using NASA Earth 
                      Observations to Support Decision Making in the 
                      USFS Monongahela National Forest"),
                      
                      p(tags$b("ABSTRACT:"), "In the Monongahela National Forest (MNF),
                        situated in the Allegheny Highlands of West Virginia, 
                        extensive logging and mining practices have significantly 
                        altered the structure and composition of flora and fauna 
                        over the past two centuries. To aid red spruce restoration, 
                        this study mapped current and historical stands and identified non-native stands
                         with suitable habitats for red spruce in the Sharp Knob 
                        Red Spruce Restoration Area. Data from Landsat 5 Thematic Mapper (TM), 
                        Landsat 8 Operational Land Imager (OLI), and Shuttle Radar Topography Mission (SRTM)
                        were input into classification tree and fuzzy logic algorithms. Furthermore, 
                        2018 classification maps were utilized in the TerrSet 
                        Land Change Modeler to forecast red spruce extent up to 2040. 
                        As a product of these analyses, we produced three sets of maps: 
                        four time series maps of red spruce stands from 1989 to 2018, 
                        a map that identifies suitable stands for future restoration efforts, 
                        and a red spruce land cover change map up to 2040. Our results 
                        indicate that 562 hectares are suitable for future restoration 
                        in Sharp’s Knob, with an 8% gain in red spruce stands from 1989 to 2018. 
                        However, forecasting results indicate that management intervention will
                        be necessary for this trend to continue.",
                        tags$a("[See project here.]", href="https://develop.larc.nasa.gov/2019/summer/MonongahelaNationalForestEco.html")),
                      
                      tags$img(src="NASAFig.png", width="90%"),
                      p(tags$b("Figure 1a:"), "Land classification change using 
                      Classification Tree Algorithm in Idrisi Terrset (left).", 
                        tags$b("Figure 1b:"), "Site suitability analysis created in ArcMap (right).")
             ),
             # tabPanel("Miscellaneous",
             #          tags$img(src="penguinDash.png", width="90%"),
             #          tags$img(src="penguinFig1.jpg", width="90%")
             # )
  ),
  # tabPanel(title="Relevant Coursework",
  #          plotOutput("Rplot", height="600px"),
  #          tags$figcaption("Time series by semester showing cumulative (light grey) 
  #            and count (dark grey) of RStudio data science classes taken. 
  #            Created in RStudio using ggplot2."),
  #          
  #          br(), br(), br(), br(), br(), br(),
  #          
  #          tableOutput("Rtable"),
  #          p("Table of each RStudio data science class and the grade earned. 
  #            Created in RStudio using kableExtra.")
  #          )
  tabPanel(title="About Me",
           h2("Bio"),
           h3("Introducing ", tags$b("Katy Yut,"), "a dynamic force of nature fueled by an unwavering 
           commitment to organization, efficiency, and order. With an instinctive knack for 
           solving complex problems and an affinity for analytical thinking, Katy 
           thrives on the exhilarating challenge of untangling complexities. When she's 
           not engrossed in her work, Katy's gaze turns skyward, captivated by the 
           enchanting world of birdwatching. But that's not her only practice in 
           patience--Katy also flexes her creative spirit in the form of sewing,
           where art meets geometry and thrift meets function. Katy's competitive spirit 
           and zest for life find expression on the banked tracks 
           of roller derby. Anchoring her adventurous spirit is her residence in the vibrant heart 
           of Austin, TX, a city as diverse and dynamic as her passions."),
           
           br(), 
           h4("Katy built this application using the ", tags$code("shiny"), 
              "package in RStudio, using a variety of R, HTML, and LaTeX. It is 
           hosted online via ", tags$code("rsconnect"), ", a package for publishing
           shiny apps."),
           br(), 
           h5(tags$i("How we spend our days is, of course, how we spend our lives. - Annie Dillard")),
           br(), 
           tags$a("LinkedIn", href="https://www.linkedin.com/in/katherine-yut/"),
           " | ",
           tags$a("GitHub", href="https://github.com/kyut0"),
           br()
  )
)

# SERVER =======================================================================
server <- function(input, output) {
  # Resume ---------------------------------------------------------------------
  output$Resume_pdfimage <- renderImage({
    list(src=paste0(RESUME, ".png"),
         width="100%")
  }, deleteFile = FALSE)
  
  output$downloadResume <- downloadHandler(
    filename = function() {
      paste0(RESUME, ".pdf")
    },
    content = function(file) {
      file.copy(paste0(RESUME, ".pdf"), file)
    }
  )
  
  # Cover Letter ---------------------------------------------------------------
  output$CoverLetter_pdfimage <- renderImage({
    list(src=paste0(COVERLETTER, ".png"),
         width="100%")
  }, deleteFile = FALSE)
  
  output$downloadCoverLetter <- downloadHandler(
    filename = function() {
      paste0(COVERLETTER, ".pdf")
    },
    content = function(file) {
      file.copy(paste0(COVERLETTER, ".pdf"), file)
    }
  )
  
  # Coursework -----------------------------------------------------------------
  # output$Rplot <- renderPlot({
  #   # Plot time series
  #   ggplot(data=df) +
  #     geom_area(aes(x=sem, y=cum, group=1), fill="grey") +
  #     geom_col(aes(x=sem, y=num, group=1), width=0.2) + 
  #     scale_y_continuous(breaks = 0:11) +
  #     labs(title="Data Analysis Experience", 
  #          subtitle="R Courses Taken in College", 
  #          x="Semester", 
  #          y="Count") 
  # })
  # 
  # output$Rtable <- function() {
  #   df2 %>%
  #     kbl(booktabs = T, linesep = "",
  #         col.names=c("Course Name", "Grade", "Semester"),
  #         align=c('l', 'c', 'l')) %>%
  #     kable_paper(full_width = T) %>%
  #     kable_styling(latex_options = c("hold_position", "striped"), stripe_index = c(1, 4:7, 9:11)) %>%
  #     column_spec(2, bold = T, color = c(rep("OliveGreen", 6), "Mahogany", "OliveGreen", "OliveGreen", "OliveGreen", "gray"))
  # }
}

# CALL APP =====================================================================
shinyApp(ui = ui, server = server)

# rsconnect::deployApp("D:/00_YUT/03_Code/GIS_Portfolio/Shiny_Portfolio")




