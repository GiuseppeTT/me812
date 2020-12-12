<div align="justify">

# ME812 - Statistical Consulting II

## Overview
This repository comprehends a class project of the courses ME712 and ME812. It was developed by the students Giuseppe Tinti Tomio (ME812), João Accorsi (ME712), Júlio Mendes (ME712), Nicholas Salgado (ME712) and Pedro Santos (ME812) under the supervision of Professor Mariana Motta. 

The project consists of a statistical analysis conducted for Professor Aquiles Neto (Institute of Language Studies, University of Campinas). He was interested in comparing the Portuguese of Angola and Mozambique.

**Warning:** currently, the data, report, presentation and dashboard are not publicly available as they are part of an unpublished research.


## How to run

### Analysis
If you have access to the data repository, you can reproduce the analysis by running the following commands in the terminal:

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

After that, the report and presentation pdfs should be available at ```documents/report/report.pdf``` and ```documents/presentation/presentation.pdf```, respectively.

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
Finally, if you have access to the docker repository, you can set up a docker container to run the analysis/dashboard by running the following commands in the terminal:

```
docker pull giuseppett/me812
docker run -ti --rm giuseppett/me812 bash
```

This will:
- Download the docker image from Docker Hub.
- Open it with a bash terminal set to the project folder path.

**Warning:** data doesn't persist in the container. In other words, if you close the container, you loose your progress. Take a look at docker volumes to prevent that from happening.


## Structure
The ```analysis.R``` is the main entry point and responsible for running the analysis. I recommend to start with this script and later move to ```app.R```, which defines the shiny dashboard.

Description of the project structure:
- Dependencies:
    - ```renv/```, ```renv.lock``` and ```.Rprofile```: are created by the renv package to setup the virtual environment. Don't manualy modify them, instead use renv functions.
- Analysis:
    - ```analysis.R```: is the main entry point and responsible for running the analysis.
    - ```utils.R```: defines auxiliar functions for ```analysis.R```, which are not directly used in the analysis.
    - ```drake/```: contains the drake plan and its functions to run the analysis workflow.
    - ```data/```: is a private repository that contains the raw data.
    - ```documents/```: contains the report and presentation files.
- Dashboard:
    - ```app.R```: defines the shiny dashboard. You need to run the analysis before using it.
    - ```shiny/```: contains the UI and server definitions used to define the shiny application.
- Additional resources:
    - ```me812.Rproj```: is created by Rstudio (R IDE) to set up a RStudio project.
    - ```makefile```: defines useful commands, which can be accessed with ```make <command name>``` in the terminal.
    - ```Dockerfile```: defines the docker image, which can be used to easily reproduce the analysis/dashboard.
    - ```.github/workflows/```: contains the workflows used by GitHub Actions for CI.
    - ```.gitignore```: defines files and folders that git should ignore.
    - ```.gitmodules```: defines submodules such as ```me812-data``` (linked to the ```data/``` folder to enforce data privacy).


## GitHub Actions
GitHub Actions is a useful tool to set up CI/CD workflows. This project set up a few:
- Analysis: set up the project on an Ubuntu machine and run the analysis to check if it is working.
- Shiny: build and deploy the shiny dashboard to shinyapps.
- Docker: build and push the docker image to Docker Hub.


## Useful Links
Some useful links:
- Dependencies:
    - renv: https://github.com/rstudio/renv/.
- Analysis:
    - drake: https://github.com/ropensci/drake.
    - tinytex: https://github.com/yihui/tinytex.
- Dashboard:
    - shiny: https://github.com/rstudio/shiny.
    - shinyapps: https://www.shinyapps.io/.
- Additional resources:
    - Rstudio projects: https://r4ds.had.co.nz/workflow-projects.html.
    - make (makefile): https://www.gnu.org/software/make/manual/make.html.
    - docker: https://www.docker.com/.
    - Docker Hub: https://hub.docker.com/.
    - GitHub Actions: https://github.com/features/actions.
    - git submodules: https://git-scm.com/book/en/v2/Git-Tools-Submodules.

</div>
