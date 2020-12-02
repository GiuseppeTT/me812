# ME812 - Statistical Consulting II

## Overview
This repository comprehends a class project of the courses ME712 and ME812. It was developed by the students Giuseppe Tinti Tomio (ME812), João Accorsi (ME712), Júlio Mendes (ME712), Nicholas Salgado (ME712) and Pedro Santos (ME812) under the supervision of Professor Mariana Motta. 

The project consists of a statistical analysis conducted for the Professor Aquiles Neto (Institute of Language Studies, University of Campinas). He was interested in comparing the Portuguese of Angola and Mozambique.

**Warning:** currently, the data, report and presentation slides are not publicly available as they are part of an unpublished research.

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

### Shiny dashboard
Additionally, you can open the shiny dashboard by running the following commands in the terminal:

```
make app
```

This will:
- Open a new window if you are using Rstudio.
- Give a link to access on your browser otherwise. 

Alternatively, you can simply visit the site https://giuseppett.shinyapps.io/me812/ (requires login).


## Structure
The ```main.R``` script is the main entry point. It loads packages, sources functions, builds a drake plan and makes (runs) it. You can run the script by simply executing ```Rscript main.R``` in the terminal.

Description of the project structure:
- ```main.R```: is the main entry point and responsible for running the analysis.
- ```app.R```: defines the shiny application. You need to run the analysis before using it.
- ```data/```: is a private repository that contains the raw data.
- ```subplans/```: contains the drake subplans used to build the main drake plan.
- ```functions/```: contains the functions used in the drake subplans. They usually start with ```my_```.
- ```shiny/```: contains the ui and server definitions used to define the shiny application.

Description of additional resources used in the project:
- ```renv/```, ```renv.lock``` and ```.Rprofile```: are created by renv to setup the virtual environment.
- ```makefile```: contains a set of useful commands, which can be accessed with ```make <command name>``` in the terminal.
- ```.github/workflows```: contains the workflows used by GitHub Actions for CI.


## Useful Links
Some useful links:
- drake: https://github.com/ropensci/drake.
- shiny: https://github.com/rstudio/shiny.
- renv: https://github.com/rstudio/renv/.
- GitHub Actions: https://github.com/features/actions.
