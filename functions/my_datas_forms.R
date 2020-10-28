# source functions to read datas
source("functions/my_read_forms.R")

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
