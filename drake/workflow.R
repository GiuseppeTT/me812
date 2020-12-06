# Load workflow functions ------------------------------------------------------
source_directory("drake/functions/")



# Load workflow subplans -------------------------------------------------------
subplans <- source_directory("drake/subplans/", environment. = NULL)



# Define workflow plan ---------------------------------------------------------
plan <- do.call(bind_plans, as.list(subplans))
