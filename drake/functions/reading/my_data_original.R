# only read
my_data_original <- function(country){
  if(country == "angola"){
    a_finite_original <- my_read_original("a_finite_original.xlsx", "finite")
    a_gerund_original <- my_read_original("a_gerund_original.xlsx", "gerund")
    a_infinitive_original <- my_read_original("a_infinitive_original.xlsx", "infinitive")
    a_past_participle_original <- my_read_original("a_past_participle_original.xlsx", "past participle")
    a_additional <- readxl::read_excel("data/additional/angola.xlsx", sheet = "FALTANTES")
    unique(my_remove_dot(rbind(a_finite_original,
                        a_gerund_original,
                        a_infinitive_original,
                        a_past_participle_original,
                        a_additional), "angola")) %>%
      return()
  }
  else{
    m_finite_original <- my_read_original("m_finite_original.xlsx", "finite")
    m_gerund_original <- my_read_original("m_gerund_original.xlsx", "gerund")
    m_infinitive_original <- my_read_original("m_infinitive_original.xlsx", "infinitive")
    m_past_participle_original <- my_read_original("m_past_participle_original.xlsx", "past participle")
    m_additional <- readxl::read_excel("data/additional/mocambique.xlsx", sheet = "FALTANTES")
    unique(my_remove_dot(rbind(m_finite_original,
                        m_gerund_original,
                        m_infinitive_original,
                        m_past_participle_original,
                        m_additional), "mocambique")) %>%
      return()
  }
}

