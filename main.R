# Load packages ----------------------------------------------------------------
library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
library(drake)



# Define helper functions for main.R -------------------------------------------
source_directory <- function(
    path,
    ...
) {
    path %>%
        fs::dir_ls(type = "file", glob = "*.R", ...) %>%
        walk(source)
}



# Load sub plans and their functions -------------------------------------------
source_directory("functions/")
source_directory("subplans/")



# Define main plan -------------------------------------------------------------
plan <- bind_plans(
    # Empty
)



# Make plan --------------------------------------------------------------------
make(plan)
