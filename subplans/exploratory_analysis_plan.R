
exploratory_analysis_plan <- drake_plan(
    summary_table = my_summary_table(complete_data),
    summary_table_order = my_summary_table_order(complete_data),

    mean_acceptability_plot = my_mean_acceptability_plot(summary_table),

)
