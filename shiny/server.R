server <- function(
    input,
    output
) {
    # Pre-work -----------------------------------------------------------------
    loadd(complete_data)
    loadd(mean_acceptabilities)
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
    output$verb_form_select_input <- renderUI({
        verb_forms <-
            mean_acceptabilities %>%
            pull(`Verb form`) %>%
            unique()

        selectInput(
            "verb_form",
            'Verb form',
            choices = verb_forms,
        )
    })

    output$order_select_input <- renderUI({
        orders <-
            mean_acceptabilities %>%
            pull(Order) %>%
            unique()

        selectInput(
            "order",
            "Order",
            choices = orders,
        )
    })

    output$mean_acceptabilities_plot <- renderPlot({
        plot_data <-
            mean_acceptabilities %>%
                filter(
                `Verb form` == input$verb_form,
                Order == input$order
            ) %>%
            mutate(Significant = if_else(`p-value` < 0.05, TRUE, FALSE, missing = FALSE))

        plot <-
            plot_data %>%
            ggplot(aes(x = `Adverb class`)) +
            facet_grid(NULL, vars(Country)) +
            coord_flip() +
            scale_y_continuous(limits = c(0, 5), expand = c(0, 0)) +
            theme_bw(base_size = 18) +
            theme(panel.spacing = unit(1, "lines"), legend.position = "top")

        if (input$mean_significance) {
            plot <-
                plot +
                geom_col(aes(y = `Mean acceptability`, fill = Significant)) +
                geom_errorbar(aes(ymin = `CI Low`, ymax = `CI High`)) +
                geom_hline(aes(yintercept = 3), size = 2, color = "red") +
                labs(
                    x = "Adverb class",
                    y = "Acceptability",
                    fill = "p-value < 0.05:"
                )

        } else {
            plot <-
                plot +
                geom_col(aes(y = `Mean acceptability`)) +
                labs(
                    x = "Adverb class",
                    y = "Acceptability"
                )
        }

        plot
    })



    # Model --------------------------------------------------------------------
    output$mean_acceptabilities <- renderDataTable({
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
