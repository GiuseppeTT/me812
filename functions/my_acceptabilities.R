# Acceptabilities
my_acceptabilities <- function(){
  #
  source("functions/my_data_original.R")
  source("functions/my_organized_forms.R")
  source("functions/my_remove_dot.R")

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

acceptabilities <- my_acceptabilities()
