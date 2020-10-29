# Cleaning extra information data
my_extra_information <- function(){
    # loading raw extra information
    source("functions/my_raw_extra_information.R")

    # change col names
    extra_informations <- my_raw_extra_information()
    colnames(extra_informations) <- c("gender", "age", "hometown", "actual_city", "other_language",
                                      "parents_language", "degree", "country", "id")


    # Replacing "-" with NA and "Opção 2" with 'Feminino'
    for (i in 1:nrow(extra_informations)) {
        for(j in 1:ncol(extra_informations)){
            if(extra_informations[i,j] == "-" | is.na(extra_informations[i,j])){
                extra_informations[i,j] = NA
            }
            else if(extra_informations[i,1] == "Opção 2")
                extra_informations[i,1] = "Feminino"
        }
    }
    return(extra_informations)
}
