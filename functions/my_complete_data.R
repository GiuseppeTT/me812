my_complete_data <- function(){
  source("functions/my_acceptabilities.R")
  source("functions/my_extra_information.R")
  source("functions/my_sentence_covariates.R")
  
  my_sentence_covariates() %>% inner_join(my_acceptabilities(), by = "sentence") %>%
    inner_join(my_extra_information(), by = c("id", "country")) %>%
    return()
}