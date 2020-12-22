# Credentials ------------------------------------------------------------------
credentials <- tibble(
    user = Sys.getenv("SHINYMANAGER_USER"),
    password = Sys.getenv("SHINYMANAGER_PASSWORD")
)



# Pre-work ---------------------------------------------------------------------
loadd(complete_data)
loadd(mean_acceptabilities)
loadd(anova_results)

responses <-
    complete_data %>%
    arrange(country, verb_form, adverb_class, order, id) %>%
    select(
        Country = country,
        `Verb Form` = verb_form,
        `Adverb Class` = adverb_class,
        Order = order,
        Sentence = sentence,
        `Participant ID` = id,
        Acceptability = acceptability
    )

participants <-
    complete_data %>%
    arrange(id, country) %>%
    select(
        `Participant ID` = id,
        Country = country,
        Gender = gender,
        Age = age,
        Degree = degree,
        Hometown = hometown,
        `Actual City` = actual_city,
        `Parents' Language` = parents_language,
        `Other Language` = other_language
    )



# Server -----------------------------------------------------------------------
server <- function(
    input,
    output
) {
    # Login screen -------------------------------------------------------------
    res_auth <- secure_server(
        check_credentials = check_credentials(credentials)
    )

    output$auth_output <- renderPrint({
        reactiveValuesToList(res_auth)
    })



    # Data ---------------------------------------------------------------------
    output$download_responses <- downloadHandler(
        filename = "responses.csv",
        content = function(file) {write_csv(responses, file)}
    )

    output$responses <- renderDataTable({responses})

    output$download_participants <- downloadHandler(
        filename = "participants.csv",
        content = function(file) {write_csv(participants, file)}
    )

    output$participants <- renderDataTable({participants})



    # Exploratory analysis -----------------------------------------------------
    output$verb_form_select_input1 <- renderUI({
        verb_forms <-
            mean_acceptabilities %>%
            pull(`Verb Form`) %>%
            unique()

        selectInput(
            "verb_form1",
            'Verb Form',
            choices = verb_forms,
        )
    })

    output$order_select_input1 <- renderUI({
        orders <-
            mean_acceptabilities %>%
            pull(Order) %>%
            unique()

        selectInput(
            "order1",
            "Order",
            choices = orders,
        )
    })

    output$mean_acceptabilities_plot <- renderPlot({
        plot_data <-
            mean_acceptabilities %>%
                filter(
                `Verb Form` == input$verb_form1,
                Order == input$order1
            )

        plot <-
            plot_data %>%
            ggplot(aes(x = `Adverb Class`)) +
            geom_col(aes(y = `Mean Acceptability`)) +
            facet_grid(NULL, vars(Country)) +
            coord_flip() +
            scale_y_continuous(limits = c(0, 5), expand = c(0, 0)) +
            theme_bw(base_size = 18) +
            theme(panel.spacing = unit(1, "lines")) +
            labs(
                x = "Adverb Class",
                y = "Mean Acceptability"
            )

        plot
    })

    output$verb_form_select_input2 <- renderUI({
        verb_forms <-
            mean_acceptabilities %>%
            pull(`Verb Form`) %>%
            unique()

        selectInput(
            "verb_form2",
            'Verb Form',
            choices = verb_forms,
        )
    })

    output$order_select_input2 <- renderUI({
        orders <-
            mean_acceptabilities %>%
            pull(Order) %>%
            unique()

        selectInput(
            "order2",
            "Order",
            choices = orders,
        )
    })

    output$country_differences_plot <- renderPlot({
        plot_data <-
            anova_results %>%
            filter(
                `Verb Form` == input$verb_form2,
                Order == input$order2
            )

        plot <-
            plot_data %>%
            ggplot(aes(x = `Adverb Class`)) +
            geom_col(aes(y = `Estimate`)) +
            coord_flip() +
            scale_y_continuous(limits = c(-5, 5), expand = c(0, 0)) +
            theme_bw(base_size = 18) +
            labs(
                x = "Adverb Class",
                y = "Acceptability Difference (Mozambique - Angola)"
            )

        plot
    })



    # Model --------------------------------------------------------------------
    output$download_mean_acceptabilities <- downloadHandler(
        filename = "acceptabilities_means.csv",
        content = function(file) {write_csv(mean_acceptabilities, file)}
    )

    output$mean_acceptabilities <- renderDataTable({
        mean_acceptabilities %>%
            mutate(`CI High` = "Infinity") %>%
            datatable() %>%
            formatRound(c("Mean Acceptability", "CI Low", "p-value"), 2) %>%
            formatRound(c("p-value"), 3)
    })

    output$download_country_differences <- downloadHandler(
        filename = "country_differences.csv",
        content = function(file) {write_csv(anova_results, file)}
    )

    output$anova_results <- renderDataTable({
        anova_results %>%
            datatable() %>%
            formatRound(c("Estimate", "CI Low", "CI High"), 2) %>%
            formatRound(c("p-value", "q-value"), 3)
    })
}
