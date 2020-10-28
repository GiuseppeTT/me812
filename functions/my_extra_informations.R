source("functions/my_datas_forms.R")

# function to create extra_informations data frame
my_extra_informations <- function(){
    # original col names
    cols <- c("Sexo:", "Idade:", "Cidade onde passaste a infância (até os 12 anos):", "Cidade onde resides:",
                                 "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?",
                                 "Língua(s) dos pais:", "Nível de instrução:", "country")

    # merging data
    extra_informations <- rbind(a_broken %>% select(cols),
          a_finite %>% select(cols),
          a_gerund %>% select(cols),
          a_past_participle %>% select(cols),
          m_gerund %>% select(cols),
          m_indicative %>% select(cols),
          m_past_participle %>% select(cols),
          m_sem1 %>% select(cols),
          m_sem2 %>% select(cols))

    # Add ID
    extra_informations$id = 0
    extra_informations$id = c(1:nrow(extra_informations))

    # # Left joins in order to add ID to each individual data frame
    # a_finite <- left_join(a_finite, extra_informations, by = cols)
    # a_gerund <- left_join(a_gerund, extra_informations, by = cols)
    # a_broken <- left_join(a_broken, extra_informations, by = cols)
    # a_past_participle <- left_join(a_past_participle, extra_informations, by = cols)
    #
    # m_gerund <- left_join(m_gerund, extra_informations, by = cols)
    # m_indicative <- left_join(m_indicative, extra_informations, by = cols)
    # m_past_participle <- left_join(m_past_participle, extra_informations, by = cols)
    # m_sem1 <- left_join(m_sem1, extra_informations, by = cols)
    # m_sem2 <- left_join(m_sem2, extra_informations, by = cols)
    #
    # # change col names
    # colnames(extra_informations) <- c("gender", "age", "hometown", "actual_city", "other_language",
    #                                   "parents_language", "degree", "country")


    # Replacing "-" with NA and "Opção 2" with 'Feminino'
    # for (i in 1:nrow(extra_informations)) {
    #     for(j in 1:ncol(extra_informations)){
    #         if(extra_informations[i,j] == "-" | is.na(extra_informations[i,j])){
    #             extra_informations[i,j] = NA
    #         }
    #         else if(extra_informations[i,1] == "Opção 2")
    #             extra_informations[i,1] = "Feminino"
    #     }
    # }
    return(extra_informations)
}
