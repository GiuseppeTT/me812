library(tidyverse)

library(shiny)
library(shinythemes)
library(shinymanager)
library(DT)

library(drake)

source("shiny/ui.R")
source("shiny/server.R")

shinyApp(ui, server)
