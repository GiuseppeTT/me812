library(tidyverse)

library(shiny)
library(shinythemes)
library(DT)

library(drake)

source("shiny/ui.R")
source("shiny/server.R")

shinyApp(ui, server)

# TODO: add github actions and remeber to remove .Rprofile during deployment
