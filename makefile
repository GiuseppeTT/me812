.PHONY:
	dependencies \
	analysis \
	app \
	clean

dependencies:
	Rscript -e "renv::restore()"

analysis:
	Rscript main.R

app:
	Rscript -e "shiny::runApp()"

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
