reading_plan <- drake_plan(
    acceptabilities = my_acceptabilities(),
    extra_information = my_extra_information(),
    sentence_covariates = my_sentence_covariates(),

    complete_data = my_complete_data(
        acceptabilities,
        extra_information,
        sentence_covariates
    ),
)
