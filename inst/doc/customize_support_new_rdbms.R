## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics('database_module.gif')

## ----eval=FALSE---------------------------------------------------------------
#  # Database Module Setup ----
#        namespace <- 'db-selector-ns'
#        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Add Database Setup Modules Here!!! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#        ## Add Database Setup Modules Here
#        database_setup_vars <- reactiveValues(bigquery = bigquery_setup_server(id = namespace ),
#                                              postgresql = postgresql_setup_server(id = namespace ) #,
#                                              # new_module = new_module_setup_server(id = namespace)
#                                              )
#        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

## ----eval=FALSE---------------------------------------------------------------
#  # install.packages('usethis')
#  usethis::create_from_github(repo_spec = 'thewileylab/ReviewR', destdir = '~/')

## ----eval=FALSE---------------------------------------------------------------
#  # install.packages('devtools')
#  devtools::load_all()

## ----eval=FALSE---------------------------------------------------------------
#  ReviewR:::dev_database_module(mod_name = 'your_module', display_name = 'Your Module Display Name')

## ----pseudo_ui_code, eval=F---------------------------------------------------
#  tagList(
#    actionButton(inputId = ns('connect'),label = 'connect'),
#    actionButton(inputId = ns('disconnect'),label = 'disconnect')
#    )

## ----pseudo_server_code, eval=FALSE-------------------------------------------
#  library(shiny)
#  ## Observe a connect button, defined in the UI function
#  observeEvent(input$connect, {
#    ## When the button is pressed, store a temporary connection
#    temp_con <- DBI::dbConnect(drv = database_driver(),
#                               user = input$username, ## A text input, with a username
#                               pass = input$password ## A password input
#                               )
#    ## Design a test to validate the temporary connection object
#    test_result <- connection_test(temp_con)
#  
#    ## If the test passes, update the reactiveValues objects for the `is_connected` and `db_con` variables
#    if(test_result == TRUE) {
#      database_export$is_connected <- 'yes'
#      database_export$db_con <- temp_con
#      ## Else, don't create connection info
#    } else {
#      database_export$is_connected <- 'no'
#    }
#  })
#  ## Let ReviewR handle the rest!

## ----pseudo_server_code2, eval=FALSE------------------------------------------
#  ## Observe a connect button, defined in the UI function
#  observeEvent(input$disconnect, (
#    ## Tell the database you are disconnecting
#    DBI::dbDisconnect(database_export$db_con)
#    ## Clear the connection info
#    database_export$db_con <- NULL
#    ## Set `is_connected` variable back to 'no'
#    database_export$is_connected <- 'no'
#  ))

## ----eval=F-------------------------------------------------------------------
#  golem::document_and_reload()

## ----eval=FALSE---------------------------------------------------------------
#  devtools::install()

## ----mod_database_module, eval=FALSE------------------------------------------
#  # UI ----
#  #' {display_name} Setup UI
#  #'
#  #' This module is designed to guide a user through the process of authenticating your database
#  #'
#  #' @param id The module namespace
#  #'
#  #' @return The {display_name} Setup UI
#  #'
#  #' @importFrom shiny NS
#  #'
#  {mod_name}_setup_ui <- function(id) {
#    ns <- NS(id)
#    tagList(
#    ## UI widgets here ----
#  
#      )
#    }
#  
#  # Server ----
#  #' {display_name} Setup Server
#  #'
#  #' @param id The Module namespace
#  #'
#  #' @return {display_name} connection variables
#  #' @export
#  #'
#  #' @importFrom DBI dbConnect
#  #'
#  {mod_name}_setup_server <- function(id) {
#    moduleServer(
#      id,
#      function(input, output, session) {
#        ns <- session$ns
#        ## {mod_name} Export Values ----
#        {mod_name}_export <- reactiveValues(
#          ### Module Info
#          moduleName = '{display_name}',
#          moduleType = 'database',
#          setup_ui = ReviewR::{mod_name}_setup_ui,
#          is_connected = 'no',
#          db_con = NULL
#          )
#        # Server Code Here ----
#  
#  
#        # Return ----
#        return({mod_name}_export)
#      }
#    )
#  }
#  

