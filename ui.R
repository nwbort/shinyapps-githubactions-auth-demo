ui <- fluidPage(
    
    # Application title
    titlePanel("GS4 authenticated via Github Actions"),
    

    flowLayout(

        mainPanel(
            tableOutput("data_table")
        )
    )
)