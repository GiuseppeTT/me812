# Load packages ----------------------------------------------------------------
library(drake)

library(tidyverse)
library(readxl)

# Define helper functions for main.R -------------------------------------------
source_directory <- function(
    path,
    ...
) {
    path %>%
        fs::dir_ls(recurse = TRUE, type = "file", glob = "*.R", ...) %>%
        walk(source)
}



# Load subplans and their functions --------------------------------------------
source_directory("functions/")
source_directory("subplans/")



# Define main plan -------------------------------------------------------------
plan <- bind_plans(
    reading_plan,
    exploratory_analysis_plan,
    model_plan
)



# Make plan --------------------------------------------------------------------
make(plan)
