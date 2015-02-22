library(shiny)

shinyUI(
  navbarPage("Predicting car MPG",
            tabPanel("Prediction",
                      fluidPage(
                        titlePanel("Predicting car MPG"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburators" = "carb"
                                        ))
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Prediction model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Data",
                      h2("Motor Trend Magazine Car Road Test Data"),
                      hr(),
                      h3("Description"),
                      helpText("Data is from the 1974 Motor Trend US magazine containing MPG and other characheristics",
                               " for 32 automobiles (1973–74 models)."),
                      h3("Variables"),
                      
                      p("  mpg  - Miles/(US) gallon"),
                      p("	 cyl  - Number of cylinders"),
                      p("	 disp	- Displacement (cu.in.)"),
                      p("	 hp   - Gross horsepower"),
                      p("	 drat - Rear axle ratio"),
                      p("	 wt   - Weight (lb/1000)"),
                      p("	 qsec - 1/4 mile time"),
                      p("	 vs   - V/S"),
                      p("	 am   - Transmission (0 = automatic, 1 = manual)"),
                      p("	 gear - Number of forward gears"),
                      p("	 carb - Number of carburators"),
                      
                      h3("Source"),
                      
                      p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.")
             )
  )
)