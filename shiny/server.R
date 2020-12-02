server <- function(
    input,
    output
) {
    # Pre-work -----------------------------------------------------------------
    loadd(complete_data)
    loadd(mean_acceptabilities)
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
    output$acceptability_means <- renderDataTable({
        mean_acceptabilities %>%
            mutate(`CI High` = "Infinity") %>%
            datatable() %>%
            formatRound(c("Mean acceptability", "CI Low", "p-value"), 2)
    })

    output$anova_results <- renderDataTable({
        anova_results %>%
            datatable() %>%
            formatRound(c("Estimate", "CI Low", "CI High", "p-value"), 2)
    })
}
