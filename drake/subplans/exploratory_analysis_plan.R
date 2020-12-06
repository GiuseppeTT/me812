exploratory_analysis_plan <- drake_plan(
    summary_table = my_summary_table(complete_data),
    summary_table_order = my_summary_table_order(complete_data),
    adverb_table = my_adverb_table(complete_data),

    mean_acceptability_plot = my_mean_acceptability_plot(summary_table),
    boxplot_verbform = my_boxplot_verbform(complete_data),
    boxplot_order = my_boxplot_order(complete_data),
    barplot_age = my_barplot_age(complete_data),
    barplot_gender = my_barplot_gender(complete_data),

)
