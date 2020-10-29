# function to create sentence covariates
my_sentence_covariates <- function(){
  # loading data original
  source("functions/my_data_original.R")
  
  # aux to change col names
  aux <- my_data_original("angola")
  
  colnames(aux) <- colnames(my_data_original("mocambique")[,-2])
  
  # merge data frames
  rbind(aux, my_data_original("mocambique")[,-2]) %>%
    return()
}

sentence_covariates = my_sentence_covariates()