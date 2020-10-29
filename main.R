# Load packages ----------------------------------------------------------------
library(drake)

library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
library(readxl)
library(purrr)


# Define helper functions for main.R -------------------------------------------
source_directory <- function(
    path,
    ...
) {
    path %>%
        fs::dir_ls(recurse = TRUE, type = "file", glob = "*.R", ...) %>%
        walk(source)
}



# Load sub plans and their functions -------------------------------------------
source_directory("functions/")
source_directory("subplans/")



# Define main plan -------------------------------------------------------------
plan <- bind_plans(
    reading_plan,
    # exploratory_analysis
    # modeling
    # relatorio
    # apresentação
)



# Make plan --------------------------------------------------------------------
make(plan)
