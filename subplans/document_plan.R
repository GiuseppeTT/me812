document_plan <- drake_plan(
    report = my_generate_report(
        knitr_in("documents/report/report.Rnw"),
        file_out("documents/report/report.pdf"),
        parameters = list(
            preamble_path = file_in("documents/report/preamble.tex"),
            title_page_path = file_in("documents/report/title_page.tex"),
            bibliography_path = file_in("documents/report/bibliography.bib")
        ),
        remove_log = TRUE
    ),

    presentation = my_generate_presentation(
        knitr_in("documents/presentation/presentation.Rnw"),
        file_out("documents/presentation/presentation.pdf"),
        parameters = list(
            preamble_path = file_in("documents/presentation/preamble.tex")
        ),
        remove_log = TRUE
    ),
)
