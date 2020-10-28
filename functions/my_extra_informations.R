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

    return(extra_informations)
}
