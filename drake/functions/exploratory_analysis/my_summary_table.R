
my_summary_table <- function(complete_data){
    complete_data %>%
    mutate(across(where(is.character), str_to_title)) %>%
    mutate(adverb_class = fct_reorder(adverb_class, adverb_level)) %>%
    group_by(country, verb_form, adverb_class) %>%
    summarise(
        n = n(),

        mean_acceptability = mean(acceptability),
        sd_acceptability = sd(acceptability),

        median_acceptability = median(acceptability),
        IQR_acceptability = IQR(acceptability)
    ) %>%
    ungroup() %>%
        return()
}

my_summary_table_order <- function(complete_data){
    complete_data %>%
    mutate(across(where(is.character), str_to_title)) %>%
    mutate(adverb_class = fct_reorder(adverb_class, adverb_level)) %>%
    group_by(country, verb_form, adverb_class, order) %>%
    summarise(
        n = n(),

        mean_acceptability = mean(acceptability),
        sd_acceptability = sd(acceptability),

        median_acceptability = median(acceptability),
        IQR_acceptability = IQR(acceptability)
    ) %>%
    ungroup() %>%
        return()
}

my_adverb_table <- function(complete_data) {
    complete_data %>%
        select(sentence,order, adverb_class, adverb_level) %>%
        distinct(.) %>%
        group_by(adverb_class, adverb_level) %>%
        mutate(n_order = length(unique(order)), n_frases = length(unique(sentence))) %>%
        select(-sentence, -order) %>%
        distinct(.) %>%
        arrange(adverb_level) %>%
        return()
}
