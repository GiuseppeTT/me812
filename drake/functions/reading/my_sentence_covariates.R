# function to create sentence covariates
my_sentence_covariates <- function(){
  # aux to change col names
  angola <- my_data_original("angola")
  mocambique <- my_data_original("mocambique")[,-2]

  colnames(angola) <- c("sentence", "adverb_class", "level", "order",
                     "country", "verb_form")

  colnames(mocambique) <- c("sentence", "adverb_class", "level", "order",
                            "country", "verb_form")

  # merge data frames
  rbind(angola, mocambique) %>%
    return()
}
