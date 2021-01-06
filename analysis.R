# Load packages and general functions ------------------------------------------
library(drake)
library(tidyverse)

source("utils.R")



# Load and execute analysis workflow -------------------------------------------
source("drake/workflow.R")
make(plan)
