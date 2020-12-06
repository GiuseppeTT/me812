.PHONY:
	dependencies \
	analysis \
	app \
	clean

dependencies:
	Rscript -e "renv::restore()"
	Rscript -e "tryCatch({tinytex::use_tinytex(from = '~/.TinyTeX/')}, error = function(e) {unlink('~/.TinyTeX/', recursive = TRUE); tinytex::install_tinytex()})"

analysis:
	Rscript analysis.R

app:
	Rscript -e "shiny::runApp()"

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
