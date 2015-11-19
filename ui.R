library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
        tags$a(href='javascript:void',
               id=inputId,
               class='action-button',
               ...)
}

shinyUI(fluidPage(
        titlePanel("Movie Explorer"),
        fluidRow(
                column(3,
                       wellPanel(
                              
                               sliderInput("reviews", "Number of reviews",
                                           50, 300, 170, step = 10),
                               sliderInput("year", "Year released", 2000, 2014, value = c(2000, 2014)),
                              # sliderInput("oscars", "Number of Oscar wins", 0, 4, 2, step = 1),
                               selectInput("oscars", "Number of oscars",
                                           c(0,1,2,3,4)),
                               #checkboxGroupInput('oscars', 'Number of oscars:', c("Zero"=0, "One"= 1, "Two"= 2,"Three"=3,"Four"= 4), selected = c(0,1,2,3,4)),
                               sliderInput("boxoffice", "Millions of Dollars at Box Office",
                                           0, 800, c(0, 800), step = 10),
                               selectInput("genre", "Movie Genre",
                                           c("All", "Action", "Adventure", "Animation", "Biography", "Comedy",
                                             "Crime", "Documentary", "Drama", "Family", "Fantasy", "History",
                                             "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
                                             "Short", "Sport", "Thriller", "War", "Western")
                               ),
                               textInput("director", "Director name contains (e.g., Miyazaki)"),
                               textInput("cast", "Cast names contains (e.g. Tom Hanks)")),
                       wellPanel(
                               selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
                               selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews") #,
                       )
                ),
                column(9,
                       ggvisOutput("plot1"),
                       wellPanel(
                               span("Number of movies selected:",
                                    textOutput("n_movies")
                               )
                       
                ),
                wellPanel(
                         h4("About"),
                                 includeMarkdown("about.md")
                         
                )
        
        )
        )   
))