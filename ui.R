ui <- fluidPage(
    
    # Application title
    titlePanel("GS4 authenticated via Github Actions - this came from Github!"),
    

    flowLayout(

        mainPanel(
            tableOutput("data_table")
        )
    )
)