my_complete_data <- function(
  acceptabilities,
  extra_information,
  sentence_covariates
){
  sentence_covariates %>% inner_join(acceptabilities, by = "sentence") %>%
    inner_join(extra_information, by = c("id", "country")) %>%
    mutate(acceptability = as.numeric(acceptability)) %>%
    return()
}
