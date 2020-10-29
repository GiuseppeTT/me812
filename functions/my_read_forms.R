my_read_forms <- function(country, path_name){
    # change directory
    if (country == "mocambique"){
        path <- "data/forms/mocambique"
        file <- file.path(path, path_name)
        var_name <- read_csv(file)
        var_name$country <- "Mozambique"
    }
    else{
        path <- "data/forms/angola"
        file <- file.path(path, path_name)
        var_name <- read_excel(file)
        var_name$country <- "Angola"
    }

    # standardizing col names
    source("functions/my_col_names.R")

    # remove NA's
    var_name = var_name[!(is.na(var_name[,1])),]

    return(my_col_names(country, path_name, var_name))
}
