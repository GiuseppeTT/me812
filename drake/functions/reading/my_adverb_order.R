.clean_string <- function(string, index){ ##CLEAN STRING FUNCTION
    fa <- function(x) iconv(x, to = "ASCII//TRANSLIT")
    string <-  fa(string)
    if(index== 1){##remove ESPAÇO e CHARACTER ESPECIAL e transforma pra e retira os ESPAÇOS BRANCOS
        string <- str_to_lower(str_replace_all(gsub(" ", "", string, fixed = TRUE), "[^[A-Za-z0-9]]", ""))
        string
    } else {
        if(index==2) {##remove CHARACTER ESPECIAL e TRANSFORMA PRA MINUSCULA e retira os ESPAÇOS BRANCOS
            string <- str_trim(str_to_lower(str_replace_all( string, "[^[A-Za-z0-9]]", " ")), side = c("left"))
            string
        } else {
            if(index==3){##remove ESPAÇO e CHARACTER ESPECIAL e NUMERO e transforma pra MINUSCULA e retira os ESPAÇOS BRANCOS
                string <- str_to_lower(str_replace_all(gsub(" ", "", string, fixed = TRUE), "[^[A-Za-z]]", ""))
                string
            } else {
                if(index ==4){ ##remove CHARACTER ESPECIAL e NUMERO e transforma pra MINUSCULA e retira os ESPAÇOS BRANCOS
                    string <- str_trim(str_to_lower(str_replace_all( string, "[^[A-Za-z]]", " ")), side = c("left"))
                    string
                }
            }
        }
    }
}

##TABELA COM OS NIVEIS DOS ADVERBIOS ENVIADA PELO PESQUISADOR
my_adverb_order_table <- function(){
    read_table2("data/stair/escada.txt") %>%
    mutate(adverb = coluna_3, adverb_class = .clean_string(coluna_3, 1), adverb_level = row_number()) %>%
    select(adverb_level,  adverb_class) %>%
    return()
}



