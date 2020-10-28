my_col_names <- function(country, path_name, var_name){
    # change col names
    if (country == "mocambique"){
        if(path_name == "m_gerund.csv"){
            colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"
        }
        else{
            if(path_name == "m_indicative.csv"){
                colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"
                colnames(var_name)[colnames(var_name) == "Nível de instrução (marcar apenas uma):"] = "Nível de instrução:"

            }
            else{
                if(path_name == "m_past_participle.csv"){
                    colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"
                    colnames(var_name)[colnames(var_name) == "Nível de instrução (marcar apenas uma):"] = "Nível de instrução:"
                }
                else{
                    if(path_name == "m_sem1.csv"){
                        colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"
                    }
                     else {
                         colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"

                     }
                }
            }
        }
    }

    else{
        if(path_name == "a_past_participle.xlsx"){
            colnames(var_name)[colnames(var_name) == "Nível de instrução (marcar apenas uma):"] = "Nível de instrução:"
            colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"
        }
        else{
            if(path_name == "a_finite.xlsx"){
                colnames(var_name)[colnames(var_name) == "Nível de instrução (marcar apenas uma):"] = "Nível de instrução:"
            }
            else{
                if(path_name == "a_broken.xlsx"){
                    colnames(var_name)[colnames(var_name) == "Nos primeiros anos da infância, aprendeste alguma outra língua para além do português?"] = "Nos primeiros anos da infância, tu aprendeste alguma outra língua para além do português?"

                }
            }
        }
    }
    return(var_name)
}
