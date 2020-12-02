model_plan <- drake_plan(
    mean_acceptabilities = my_estimate_mean_acceptabilities(complete_data),

    simultaneous_anovas = my_fit_simultaneous_anovas(complete_data),
    anova_results = my_extract_results(simultaneous_anovas),
    residue_plot = my_plot_qq_residue(simultaneous_anovas),
)
