# ME812 - Statistical Consulting II

## Overview
This repository comprehends a class project of the courses ME712 and ME812. It was developed by the students Giuseppe Tinti Tomio (ME812), João Accorsi (ME712), Júlio Mendes (ME712), Nicholas Salgado (ME712) and Pedro Santos (ME812) under the supervision of Professor Mariana Motta. 

The project consists of a statistical analysis conducted for the Professor Aquiles Neto (Institute of Language Studies, University of Campinas). He was interested in comparing the Portuguese of Angola and Mozambique.

**Warning:** currently, the data, report, presentation and dashboard are not publicly available as they are part of an unpublished research.

## How to run
### Analysis
If you have access to the data private repository, you can reproduce the analysis by running the following commands in the terminal:

```
git clone --recurse-submodules https://github.com/GiuseppeTT/me812.git
cd me812

make dependencies
make analysis
```

This will:
- Clone the project to the folder ```me812/``` in your current path.
- Access the project folder.
- Install the necessary R dependencies (through a virtual environment).
- Run the analysis (i.e. clean data, run models, build report and build presentation).

### Dashboard
Additionally, you can open the shiny dashboard by running the following command in the terminal:

```
make app
```

This will:
- Open a new window if you are using Rstudio.
- Give a link to access on your browser otherwise. 

Alternatively, you can simply visit the site https://giuseppett.shinyapps.io/me812/ (requires login).

### Container
Finally, if you have access, you can use a docker container to run the analysis/dashboard by running the following commands in the terminal:

```
docker pull giuseppett/me812
docker run -ti giuseppett/me812 bash
```

This will:
- Download the container from dockerhub.
- Open it with a bash terminal.


## Structure
The ```analysis.R``` script is the main entry point. It loads packages, sources functions, builds a drake plan and makes (runs) it. You can run the script by simply executing ```Rscript analysis.R``` in the terminal.

Description of the project structure:
- ```analysis.R```: is the main entry point and responsible for running the analysis.
- ```app.R```: defines the shiny application. You need to run the analysis before using it.
- ```data/```: is a private repository that contains the raw data.
- ```subplans/```: contains the drake subplans used to build the main drake plan.
- ```functions/```: contains the functions used in the drake subplans. They usually start with ```my_```.
- ```shiny/```: contains the ui and server definitions used to define the shiny application.
- ```documents/```: contains the report and presentation files

Description of additional resources used in the project:
- ```renv/```, ```renv.lock``` and ```.Rprofile```: are created by renv to setup the virtual environment.
- ```makefile```: contains a set of useful commands, which can be accessed with ```make <command name>``` in the terminal.
- ```.github/workflows/```: contains the workflows used by GitHub Actions for CI.
- ```Dockerfile```: defines the docker container used to possibly reproduce the analysis/dashboard.
- ```.Renviron```: defines environment variables and is currently only used to provide credentials to shinyapps.
- ```.gitignore```: defines files and folders that git should ignore.
- ```.gitmodules```: defines submodules such as ```me812-data``` module linked to ```data/``` folder for the private data.

## Useful links
Some useful links:
- drake: https://github.com/ropensci/drake.
- shiny: https://github.com/rstudio/shiny.
- shinyapps: https://www.shinyapps.io/.
- docker: https://www.docker.com/.
- renv: https://github.com/rstudio/renv/.
- knitr: https://github.com/yihui/knitr.
- tinytex: https://github.com/yihui/tinytex.
- GitHub Actions: https://github.com/features/actions.
