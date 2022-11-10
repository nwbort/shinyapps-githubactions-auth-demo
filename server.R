server <- function(input, output) {
    
    output$data_table <- renderTable({
        
        df
        
    })
}