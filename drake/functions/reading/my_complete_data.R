my_complete_data <- function(
  acceptabilities,
  extra_information,
  sentence_covariates,
  adverb_orders
){
  sentence_covariates %>% inner_join(acceptabilities, by = "sentence") %>%
    inner_join(extra_information, by = c("id", "country")) %>%
    mutate(adverb_class = .clean_string(adverb_class ,1)) %>%
    inner_join(adverb_orders, by = c("adverb_class")) %>%
    mutate(acceptability = as.numeric(acceptability)) %>%
    return()
}

