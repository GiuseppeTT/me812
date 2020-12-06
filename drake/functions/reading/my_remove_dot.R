# remove "  " and "."
my_remove_dot <- function(data, country){
  if(country == "angola"){
    data$LM <- data$LM %>% str_replace_all(pattern = "  ", replacement = " ")
    data$LM <- data$LM %>% str_replace_all("[.]", "")
  }
  else {
    if(country == "mocambique"){
        data$Sentence <- data$Sentence %>% str_replace_all(pattern = "  ", replacement = " ")
        data$Sentence <- data$Sentence %>% str_replace_all("[.]", "")
    }
    else {
        data$sentence <- data$sentence %>% str_replace_all(pattern = "  ", replacement = " ")
        data$sentence <- data$sentence %>% str_replace_all("[.]", "")
    }
  }
  return(data)
}
