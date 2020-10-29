# Add id forms
my_add_id <- function(var_name){
    #
    source("functions/my_raw_extra_information.R")

    extra_informations <- my_raw_extra_information()
    cols <- c("Sexo:", "Idade:", "Cidade onde passaste a infância (até os 12 anos):", "Cidade onde resides:",
              "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?",
              "Língua(s) dos pais:", "Nível de instrução:", "country")

    # Left joins in order to add ID to each individual data frame
    var_name %>% left_join(extra_informations, by = cols) %>%
        return()
}

# Applying function to data frames
a_broken_forms <- my_add_id(a_broken)
a_finite_forms <- my_add_id(a_finite)
a_gerund_forms <- my_add_id(a_gerund)
a_past_participle_forms <- my_add_id(a_past_participle)

m_gerund_forms <- my_add_id(m_gerund)
m_indicative_forms <- my_add_id(m_indicative)
m_past_participle_forms <- my_add_id(m_past_participle)
m_sem1_forms <- my_add_id(m_sem1)
m_sem2_forms <- my_add_id(m_sem2)

