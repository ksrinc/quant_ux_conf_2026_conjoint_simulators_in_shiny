library(shiny)
library(bslib)

# Placeholder functions: replace with your own custom code and functions  ----------------------------
# Custom validation functions can be set up to perform error checking and return error messages
custom_validation_function <- function(scenario) {
  NULL
}
# Custom functions can be set to return a data frame of simulated results or other needed outputs
custom_calculation_function <- function(scenario) {
  # Placeholder: random share for the selected product; None takes the remainder
  product_share <- round(runif(1, min = 0.2, max = 0.9) * 100, 1)
  data.frame(Option = c(sprintf("%s @ $%.2f", scenario$Flavor, scenario$Price), "None"),
    `Share of Preference` = sprintf("%.1f%%", c(product_share, 100 - product_share)),
    check.names = FALSE
  )
}
# Can also pull in existing data to use in custom calculations, additional analyses, segment cuts, etc.
# utilities <- read.csv("./relevant_utility_data_file.csv") #commented out for this example code

# UI ---------------------------------------------------------------------------
ui <- page_sidebar(
  title = "Simulator Example",
  sidebar = sidebar(
selectInput("flavor", "Flavor", choices = c("Vanilla", "Chocolate", "Strawberry")),
    numericInput("price", "Price", value = 3.99, min = 3.99, max = 5.99, step = 0.10)
  ),
  layout_columns(
    col_widths = c(4, 8),
    card(card_header("Scenario"), tableOutput("scenario")),
    card(card_header("Simulated results"), tableOutput("results"),
      tags$p(tags$em("Note - App simulates random SOP numbers and is for illustrative purposes only."))
    )
  )
)

# Server -----------------------------------------------------------------------
server <- function(input, output, session) {
  scenario <- reactive({
    data.frame(Flavor = input$flavor, Price = input$price)
  })
  output$scenario <- renderTable({
    scenario()
  })
  output$results <- renderTable({
    msg <- custom_validation_function(scenario())
    validate(need(is.null(msg), msg))
    custom_calculation_function(scenario())
  })
}
shinyApp(ui, server)
