.PHONY:
	dependencies \
	analysis \
	app \
	clean

dependencies:
	Rscript -e "renv::restore()"
	Rscript -e "tryCatch({tinytex::use_tinytex(from = '.tinytex/')}, error = function(e) {unlink('.tinytex/', recursive = TRUE); tinytex::install_tinytex(dir = '.tinytex/')})"

analysis:
	Rscript main.R

app:
	Rscript -e "shiny::runApp()"

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
