# Load workflow functions and subplans -----------------------------------------
source_directory("drake/functions/")



# Load workflow subplans -------------------------------------------------------
subplans <- source_directory("drake/subplans/", assign_to_environment = FALSE)



# Define workflow plan ---------------------------------------------------------
plan <- do.call(bind_plans, as.list(subplans))
