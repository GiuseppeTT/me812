my_fit_simultaneous_anovas <- function(
    complete_data
) {
    analysis_data <-
        complete_data %>%
        select(adverb_class, verb_form, order, everything()) %>%
        group_by(adverb_class, verb_form, order) %>%
        filter(n_distinct(country) == 2) %>%
        ungroup()

    analysis_data <-
        analysis_data %>%
        mutate(
            adverb_class = str_to_title(adverb_class),
            verb_form = str_to_title(verb_form)
        ) %>%
        mutate(adverb_class = fct_reorder(adverb_class, adverb_level))

    simultaneous_anovas <-
        analysis_data %>%
        group_by(adverb_class, verb_form, order) %>%
        nest() %>%
        ungroup()

    simultaneous_anovas <-
        simultaneous_anovas %>%
        rowwise() %>%
        mutate(model = list(lm(acceptability ~ country, data = data))) %>%
        ungroup() %>%
        select(-data)

    return(simultaneous_anovas)
}

my_extract_results <- function(
    simultaneous_anovas
) {
    results <-
        simultaneous_anovas %>%
        mutate(n = n()) %>%
        rowwise() %>%
        mutate(result = list(broom::tidy(
            model,
            conf.int = TRUE,
            conf.level = 1 - 0.05 / n
        ))) %>%
        ungroup() %>%
        unnest(result) %>%
        filter(term != "(Intercept)") %>%
        mutate(q.value = qvalue::qvalue(p.value)$qvalues) %>%
        mutate(p.value = p.adjust(p.value))

    results <-
        results %>%
        select(
            `Adverb Class` = adverb_class,
            `Verb Form` = verb_form,
            Order = order,
            Estimate = estimate,
            `CI Low` = conf.low,
            `CI High` = conf.high,
            `p-value` = p.value,
            `q-value` = q.value
        )

    return(results)
}

my_plot_qq_residue <- function(
    simultaneous_anovas
) {
    residues <-
        simultaneous_anovas %>%
        rowwise() %>%
        mutate(residue = list(resid(model))) %>%
        ungroup() %>%
        unnest(residue)

    residue_plot <-
        residues %>%
        ggplot(aes(sample = residue)) +
            qqplotr::stat_qq_band(conf = 0.95) +
            qqplotr::stat_qq_line() +
            qqplotr::stat_qq_point() +
            labs(
                x = "Sample",
                y = "Theorical"
            ) +
            theme_bw()

    return(residue_plot)
}
