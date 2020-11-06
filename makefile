.PHONY:
	dependencies \
	project \
	clean

dependencies:
	Rscript -e "install.packages('renv')"
	Rscript -e "renv::restore()"

project:
	Rscript main.R

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
