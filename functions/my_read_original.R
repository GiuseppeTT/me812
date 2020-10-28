my_read_original <- function(path_name, verb_form){
  # change directory
  path <- "data/original"
  file <- file.path(path, path_name)
  
  # read data
  var_name <- read_excel(file, sheet = "Feuil1")

  # Add verb form
  var_name$verb_form <- verb_form
  
  # remove cols
  if(var_name$Subset[1] == "Angola"){
    var_name <- var_name[,-c(2,7:ncol(var_name))]
    var_name <- na.omit(var_name)
    var_name <- unique(var_name)
  }
  else{
    var_name <- var_name[,-c(3,8:ncol(var_name))]
    var_name <- na.omit(var_name)
    var_name <- unique(var_name)
  }
  return(var_name)
}
