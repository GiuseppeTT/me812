.PHONY:
	dependencies \
	analysis \
	app \
	clean

dependencies:
	Rscript -e "renv::restore()"
	Rscript -e "tinytex::install_tinytex(dir = '.tinytex');tinytex::use_tinytex(from = '.tinytex')"

analysis:
	Rscript main.R

app:
	Rscript -e "shiny::runApp()"

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
