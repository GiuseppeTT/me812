my_mean_acceptability_plot <- function(summary_table){
    summary_table %>%
        ggplot(aes(x = adverb_class, y = mean_acceptability)) +
        geom_col() +
        facet_grid(vars(country), vars(verb_form)) +
        scale_y_continuous(limits = c(0, 5), expand = c(0, 0)) +
        coord_flip() +
        labs(
            x = "Classe adverbial",
            y = "Aceitabilidade"
        ) +
        theme_bw(base_size = 13) +
        theme(panel.spacing = unit(1, "lines")) %>%
        return()
    }




my_boxplot_verbform <- function(complete_data){
    my_summary_table(complete_data) %>%
        ggplot(aes(x = verb_form, y = mean_acceptability, color = country)) +
        geom_boxplot() +
        scale_y_continuous(limits = c(0, 5), expand = c(0, 0)) +
        coord_flip() +
        labs(
            x = "Forma Verbal",
            y = "Aceitabilidade",
            color = "País"
        ) +
        theme_bw(base_size = 13)  %>%
        return()
}

my_boxplot_order <- function(complete_data){
    my_summary_table_order(complete_data) %>%
        ggplot(aes(x = order, y = mean_acceptability)) +
        geom_boxplot() +
        scale_y_continuous(limits = c(0, 5), expand = c(0, 0)) +
        coord_flip() +
        labs(
            x = "Ordem",
            y = "Aceitabilidade"
        ) +
        theme_bw(base_size = 13) %>%
        return()
}


my_barplot_age<- function(complete_data){
    complete_data %>%
        distinct(id,.keep_all = T) %>%
        group_by(age) %>%
        count() %>%
        mutate(age = str_remove_all(age, " anos")) %>%
        ggplot(aes(x = age, y = n)) +
        geom_bar(stat = "identity") +
        geom_text(aes(label = n ), vjust=-0.25, color = "grey21")  +
        labs(
            y = "Frequência",
            x = "Faixa Etária (anos)"
        ) +
    theme_bw(base_size = 13) %>%
        return()
}

my_barplot_gender <- function(complete_data){
    complete_data %>%
        distinct(id,.keep_all = T) %>%
        group_by(gender, country) %>%
        mutate(n = n()) %>%
        ggplot(aes(x = gender, y = n)) +
        geom_bar(stat = "identity",position = 'dodge') +
        facet_grid(cols = vars(country)) +
        geom_text(aes(label = n ), vjust= -0.25, color = "gray21") +
        labs(
            y = "Frequência",
            x = "Gênero"
        ) +
        theme_bw(base_size = 13) %>%
        return()
}

