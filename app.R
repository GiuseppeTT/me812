# Load packages ----------------------------------------------------------------
library(drake)
library(tidyverse)

library(shiny)
library(shinythemes)
library(shinymanager)
library(DT)



# Load UI and server -----------------------------------------------------------
source("shiny/ui.R")
source("shiny/server.R")



# Create shiny app -------------------------------------------------------------
shinyApp(ui, server)
