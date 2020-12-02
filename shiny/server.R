server <- function(
    input,
    output
) {
    # Pre-work -----------------------------------------------------------------
    loadd(complete_data)
    loadd(mean_acceptability_plot)
    loadd(anova_results)



    # Data ---------------------------------------------------------------------
    output$responses <- renderDataTable({
        complete_data %>%
            arrange(country, verb_form, adverb_class, order, id) %>%
            select(
                Country = country,
                `Verb form` = verb_form,
                `Adverb class` = adverb_class,
                Order = order,
                Sentence = sentence,
                `Participant ID` = id,
                Acceptability = acceptability
            )
    })

    output$participants <- renderDataTable({
        complete_data %>%
            arrange(id, country) %>%
            select(
                `Participant ID` = id,
                Country = country,
                Gender = gender,
                Age = age,
                Degree = degree,
                Hometown = hometown,
                `Actual city` = actual_city,
                `Parents' language` = parents_language,
                `Other language` = other_language
            )
    })



    # Exploratory analysis -----------------------------------------------------
    output$mean_acceptability_plot <- renderPlot({mean_acceptability_plot})



    # Model --------------------------------------------------------------------
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

    output$acceptability_means <- renderDataTable({
        summarized_data <-
            complete_data %>%
            mutate(adverb_class = fct_reorder(adverb_class, adverb_level)) %>%
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

        acceptability_means %>%
            datatable() %>%
            formatRound(c("Mean acceptability", "CI Low", "p-value"), 2)
    })

    output$anova_results <- renderDataTable({
        anova_results %>%
        datatable() %>%
        formatRound(c("Estimate", "CI Low", "CI High", "p-value"), 2)
    })
}
