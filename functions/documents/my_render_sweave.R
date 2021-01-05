# https://stackoverflow.com/questions/49532418/reuse-r-code-with-knitr-in-rnw-sweave-files
.knit_parametrized <- function(
    parameters,
    ...
) {
    # Parent environment needs to be globalenv, otherwise library() won't work
    knitr::knit(envir = list2env(parameters, parent = globalenv()), ...)
}

# Pass parameters to .Rnw as variables through an environment. This is done to
# reproduce the params argument in rmarkdown::render().
#
# https://stackoverflow.com/questions/32257970/knitr-inherits-variables-from-a-users-environment-even-with-envir-new-env
knit_parametrized <- function(
    ...
) {
    # .knit_parametrized needs to be run in another session (callr::r()) to
    # prevent globalenv from leaking into knit files
    .knit_parametrized %>%
        callr::r(args = list(...), show = TRUE)
}

remove_corresponding_log <- function(
    file
) {
    log_file <-
        file %>%
        fs::path_file() %>%
        fs::path_ext_set("log")

    if (fs::file_exists(log_file))
        fs::file_delete(log_file)
}

my_render_sweave <- function(
    source_path,
    output_path,
    parameters = list(),
    engine = "pdflatex",
    keep_intermediate_file = FALSE,
    remove_log = FALSE
) {
    if (keep_intermediate_file)
        intermediate_file <- fs::path_ext_set(source_path, "tex")
    else
        intermediate_file <- fs::file_temp(ext = "tex")

    source_path %>%
        knit_parametrized(parameters = parameters, output = intermediate_file) %>%
        tinytex::latexmk(pdf_file = output_path, engine = engine)

    if (remove_log)
        remove_corresponding_log(intermediate_file)
}
