ui <- navbarPage(
    # Configurations -----------------------------------------------------------
    title = "ME812 - Statistical Consulting II",
    theme = shinytheme("flatly"),



    # Description --------------------------------------------------------------
    tabPanel(
        title = "Description",
        h2("Project description"),
        p(style = "text-align: justify;", "This dashboard comprehends a", a("class project", href = "https://github.com/GiuseppeTT/me812"), "of the courses ME712 and ME812. It was developed by the students Giuseppe Tinti Tomio (ME812), João Accorsi (ME712), Júlio Mendes (ME712), Nicholas Salgado (ME712) and Pedro Santos (ME812) under the supervision of Professor Mariana Motta."),
        p(style = "text-align: justify;", "The project consists of a statistical analysis conducted for the Professor Aquiles Neto (Institute of Language Studies, University of Campinas). He was interested in comparing the Portuguese of Angola and Mozambique.")
    ),



    # Data ---------------------------------------------------------------------
    navbarMenu(
        title = "Data",
        tabPanel(
            title = "Responses",
            h2("Responses"),
            dataTableOutput("responses")
        ),
        tabPanel(
            title = "Participants",
            h2("Participants"),
            dataTableOutput("participants")
        )
    ),



    # Exploratory analysis -----------------------------------------------------
    navbarMenu(
        title = "Exploratory analysis",
        tabPanel(
            title = "Means",
            sidebarPanel(
                h3("Acceptability means"),
                uiOutput("verb_form_select_input"),
                uiOutput("order_select_input"),
                radioButtons(
                    "mean_significance",
                    "Include statistical significance:",
                    choices = c("Yes" = TRUE, "No" = FALSE),
                    selected = FALSE
                )
            ),
            mainPanel(
                plotOutput("mean_acceptabilities_plot", height = "700")
            )
        ),
        tabPanel(
            title = "Participants",
            "Empty"
        )
    ),



    # Model --------------------------------------------------------------------
    navbarMenu(
        title = "Model",
        tabPanel(
            title = "Means",
            h2("Acceptability means"),
            p(style = "text-align: justify;", "This table summarizes the mean value for each combination of country, verb form, adverb class and order. The p-values test if each mean is bigger than three, which suggests that the given sentence is well formed for the given country. Here, each sentence is represented by a combination of verb form, adverb class and order."),
            p(style = "text-align: justify;", "Observation: the p-values were adjusted with the Holm method and the confidence intervals with the Bonferroni method. This is done to adjust for the inflation of p-value due to multiple comparissons."),
            dataTableOutput("mean_acceptabilities")
        ),
        tabPanel(
            title = "ANOVA",
            h2("ANOVA"),
            p(style = "text-align: justify;", "This table summarizes the ANOVA results of the country factor for each combination of verb form, adverb class and order. The p-values test if the acceptability mean of Angola differs from Mozambique for each sentence, which suggests that there is a structural difference in the Portuguese of said countries. Here, each sentence is represented by a combination of verb form, adverb class and order."),
            p(style = "text-align: justify;", "Observation: the p-values were adjusted with the Holm method and the confidence intervals with the Bonferroni method. This is done to adjust for the inflation of p-value due to multiple comparissons."),
            dataTableOutput("anova_results")
        )
    )
)
