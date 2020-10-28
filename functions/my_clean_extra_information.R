source("functions/my_extra_informations.R")

my_clean_extra_information <- function(){
    # change col names
    extra_informations <- my_extra_informations()
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

# Creating extra_information data frame
extra_information <- my_clean_extra_information()
