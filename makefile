.PHONY:
	dependencies \
	analysis \
	clean

dependencies:
	Rscript -e "renv::restore()"

analysis:
	Rscript main.R

clean:
	Rscript -e "drake::clean(destroy = TRUE)"
