smart_t_test <- function(
    x,
    ...
) {
    if (all(x == x[1])) {
        tibble(estimate = x[1]) %>%
            return()
    } else {
        x %>%
            t.test(...) %>%
            broom::tidy() %>%
            return()
    }
}

my_estimate_mean_acceptabilities <- function(
    complete_data
) {
    summarized_data <-
        complete_data %>%
        mutate(adverb_class = fct_reorder(adverb_class, adverb_level)) %>%
        mutate(
            adverb_class = str_to_title(adverb_class),
            verb_form = str_to_title(verb_form)
        ) %>%
        select(country, verb_form, adverb_class, order, acceptability) %>%
        group_by(country, verb_form, adverb_class, order) %>%
        summarise(acceptability = list(acceptability)) %>%
        ungroup()

    group_count <- nrow(summarized_data)

    acceptability_means <-
        summarized_data %>%
        rowwise() %>%
        mutate(t_test = list(smart_t_test(
            acceptability,
            alternative = "greater",
            mu = 3,
            conf.level = 1 - 0.05 / group_count
        ))) %>%
        ungroup() %>%
        unnest(t_test) %>%
        mutate(p.value = p.adjust(p.value)) %>%
        select(
            Country = country,
            `Verb form` = verb_form,
            `Adverb class` = adverb_class,
            Order = order,
            `Mean acceptability` = estimate,
            `CI Low` = conf.low,
            `CI High` = conf.high,
            `p-value` = p.value
        )

    return(acceptability_means)
}
