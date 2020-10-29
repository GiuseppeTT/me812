# function to create extra_informations data frame
my_raw_extra_information <- function(){
    # loading data forms
    # only read
    a_broken <- my_read_forms("angola", "a_broken.xlsx")
    a_finite <- my_read_forms("angola", "a_finite.xlsx")
    a_gerund <- my_read_forms("angola", "a_gerund.xlsx")
    a_past_participle <- my_read_forms("angola", "a_past_participle.xlsx")

    m_gerund <- my_read_forms("mocambique", "m_gerund.csv")
    m_indicative <- my_read_forms("mocambique", "m_indicative.csv")
    m_past_participle <- my_read_forms("mocambique", "m_past_participle.csv")
    m_sem1 <- my_read_forms("mocambique", "m_sem1.csv")
    m_sem2 <- my_read_forms("mocambique", "m_sem2.csv")

    # Remove identity line
    a_past_participle <- a_past_participle[-15,]

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
