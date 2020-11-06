

my_mean_acceptability_plot <- function(summary_table){
    summary_table %>%
        ggplot(aes(x = adverb_class, y = mean_acceptability)) +
        geom_col() +
        geom_errorbar(aes(
            ymin = mean_acceptability - sd_acceptability / sqrt(n),
            ymax = mean_acceptability + sd_acceptability / sqrt(n)
    )) +
        facet_grid(vars(country), vars(verb_form)) +
        scale_y_continuous(limits = c(0, 5), expand = c(0, 0)) +
        coord_flip() +
        labs(
            x = "Adverb class",
            y = "Acceptability"
        ) +
        theme_bw() +
        theme(panel.spacing = unit(1, "lines")) %>%
             return()
    }

