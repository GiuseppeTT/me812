# UI ---------------------------------------------------------------------------
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
            sidebarPanel(
                h3("Responses"),
                downloadButton("download_responses", "Download data"),
                width = 3
            ),
            mainPanel(
                dataTableOutput("responses")
            )
        ),
        tabPanel(
            title = "Participants",
            sidebarPanel(
                h3("Participants"),
                downloadButton("download_participants", "Download data"),
                width = 3
            ),
            mainPanel(
                dataTableOutput("participants")
            )
        )
    ),



    # Exploratory analysis -----------------------------------------------------
    navbarMenu(
        title = "Exploratory analysis",
        tabPanel(
            title = "Acceptability means",
            sidebarPanel(
                h3("Acceptability means"),
                uiOutput("verb_form_select_input1"),
                uiOutput("order_select_input1")
            ),
            mainPanel(
                plotOutput("mean_acceptabilities_plot", height = "700")
            )
        ),
        tabPanel(
            title = "Country differences",
            sidebarPanel(
                h3("Country differences"),
                uiOutput("verb_form_select_input2"),
                uiOutput("order_select_input2")
            ),
            mainPanel(
                plotOutput("country_differences_plot", height = "700")
            )
        )
    ),



    # Model --------------------------------------------------------------------
    navbarMenu(
        title = "Model",
        tabPanel(
            title = "Acceptability means",
            sidebarPanel(
                h3("Acceptability means"),
                downloadButton("download_mean_acceptabilities", "Download data"),
                width = 3
            ),
            mainPanel(
                p(style = "text-align: justify;", "This table summarizes the mean acceptability for each combination of country, verb form, adverb class and order. The p-values test if each mean is bigger than three, which suggests that the given sentence is well formed for the given country. Here, each sentence is represented by a combination of verb form, adverb class and order."),
                p(style = "text-align: justify;", "Observation: the p-values were adjusted with the Holm method and the confidence intervals with the Bonferroni method. This is done to adjust for the inflation of p-values due to multiple comparisons. Thus, if you consider only combinations with p-values less than 5%, then, supposing there is no mean bigger than 3 at all, the probability of rejecting ANY hypothesis erroneously is only 5%."),
                dataTableOutput("mean_acceptabilities")
            )
        ),
        tabPanel(
            title = "Country differences",
            sidebarPanel(
                h3("Country differences"),
                downloadButton("download_country_differences", "Download data"),
                width = 3
            ),
            mainPanel(
                p(style = "text-align: justify;", "This table summarizes the ANOVA results of the country factor for each combination of verb form, adverb class and order. The p-values and q-values test if the acceptability mean of Mozambique differs from Angola for each sentence, which suggests that there is a structural difference in the Portuguese of said countries. Here, each sentence is represented by a combination of verb form, adverb class and order."),
                p(style = "text-align: justify;", "Observation: the p-values were adjusted with the Holm method and the confidence intervals with the Bonferroni method. This is done to adjust for the inflation of p-values due to multiple comparisons. Thus, if you consider only combinations with p-values less than 5%, then, supposing there is no difference between the two countries at all, the probability of rejecting ANY hypothesis erroneously is only 5%. Correspondly, if you consider only combinations with q-values less than 5%, then the proportion of erroneously rejected hypothesis is only 5%."),
                dataTableOutput("anova_results")
            )
        )
    )
)



# Apply login screen -----------------------------------------------------------
ui <- secure_app(ui)
