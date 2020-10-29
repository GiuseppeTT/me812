my_add_id <- function(var_name){
  extra_informations <- my_raw_extra_information()
  cols <- c("Sexo:", "Idade:", "Cidade onde passaste a infância (até os 12 anos):", "Cidade onde resides:",
            "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?",
            "Língua(s) dos pais:", "Nível de instrução:", "country")

  # Left joins in order to add ID to each individual data frame
  var_name %>% left_join(extra_informations, by = cols) %>%
    return()
}

# Acceptabilities
my_acceptabilities <- function(){
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

  a_broken_forms <- my_add_id(a_broken)
  a_finite_forms <- my_add_id(a_finite)
  a_gerund_forms <- my_add_id(a_gerund)
  a_past_participle_forms <- my_add_id(a_past_participle)

  m_gerund_forms <- my_add_id(m_gerund)
  m_indicative_forms <- my_add_id(m_indicative)
  m_past_participle_forms <- my_add_id(m_past_participle)
  m_sem1_forms <- my_add_id(m_sem1)
  m_sem2_forms <- my_add_id(m_sem2)

  a_finite_forms = a_finite_forms[,-c(1,154:167)] %>% gather(value = "acceptability", key = "sentence", -id)
  a_gerund_forms = a_gerund_forms[,-c(1,180:193)] %>% gather(value = "acceptability", key = "sentence", -id)
  a_broken_forms = a_broken_forms[,-c(1,107:119)]  %>% gather(value = "acceptability", key = "sentence", -id)
  a_past_participle_forms = a_past_participle_forms[,-c(1,154:166)]  %>% gather(value = "acceptability", key = "sentence", -id)
  m_gerund_forms = m_gerund_forms[,-c(1,184:196)]  %>% gather(value = "acceptability", key = "sentence", -id)
  m_indicative_forms = m_indicative_forms[,-c(1,170:183)]  %>% gather(value = "acceptability", key = "sentence", -id)
  m_sem1_forms = m_sem1_forms[,-c(1,76:88)]  %>% gather(value = "acceptability", key = "sentence", -id)
  m_sem2_forms = m_sem2_forms[,-c(1,83:95)] %>% gather(value = "acceptability", key = "sentence", -id)
  m_past_participle_forms = m_past_participle_forms[,-c(1,164:176)] %>% gather(value = "acceptability", key = "sentence", -id)


  rbind(my_remove_dot(a_broken_forms, "forms") %>%
          semi_join(my_data_original("angola"), by = c("sentence" = "LM")),
        my_remove_dot(a_finite_forms, "forms") %>%
          semi_join(my_data_original("angola"), by = c("sentence" = "LM")),
        my_remove_dot(a_gerund_forms, "forms") %>%
          semi_join(my_data_original("angola"), by = c("sentence" = "LM")),
        my_remove_dot(a_past_participle_forms, "forms") %>%
          semi_join(my_data_original("angola"), by = c("sentence" = "LM")),
        my_remove_dot(m_gerund_forms, "forms") %>%
            semi_join(my_data_original("mocambique"), by = c("sentence" = "Sentence")),
        my_remove_dot(m_sem1_forms, "forms") %>%
            semi_join(my_data_original("mocambique"), by = c("sentence" = "Sentence")),
        my_remove_dot(m_sem2_forms, "forms") %>%
            semi_join(my_data_original("mocambique"), by = c("sentence" = "Sentence")),
        my_remove_dot(m_past_participle_forms, "forms") %>%
            semi_join(my_data_original("mocambique"), by = c("sentence" = "Sentence")),
        my_remove_dot(m_indicative_forms, "forms") %>%
            semi_join(my_data_original("mocambique"), by = c("sentence" = "Sentence"))) %>%
      return()
}
