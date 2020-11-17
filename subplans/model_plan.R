model_plan <- drake_plan(
    simultaneous_anovas = my_fit_simultaneous_anovas(complete_data),
    anova_results = my_extract_results(simultaneous_anovas),
    residue_plot = my_plot_qq_residue(simultaneous_anovas),
)
