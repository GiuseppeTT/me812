.PHONY:
	dependencies \
	analysis \
	app \
	clean

dependencies:
	Rscript -e "renv::restore()"
	Rscript -e "tryCatch({tinytex::use_tinytex(from = '/home/runner/.TinyTeX/')}, error = function(e) {unlink('/home/runner/.TinyTeX/', recursive = TRUE); tinytex::install_tinytex()})"

analysis:
	Rscript main.R

app:
	Rscript -e "shiny::runApp()"

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
