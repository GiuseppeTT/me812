# ME812

## Overview
This repository comprehends a class project of the courses ME712 and ME812. It was developed by the students Giuseppe Tinti Tomio (ME812), João Accorsi (ME712), Júlio Mendes (ME712), Nicholas Salgado (ME712) and Pedro Santos (ME812) under the supervision of Professor Mariana Motta. 

The project consists of a statistical analysis conducted for the Professor Aquiles Neto, from Institute of Language Studies - University of Campinas. He was interested in comparting the Portuguese of Angola and Moçambique.


## How to run
You can reproduce the analysis by running the following commands in the terminal:

```
git clone https://github.com/GiuseppeTT/me812
cd me812

make dependencies
make project
```

This will:
- Clone the project to the folder ```me812``` in your current path
- Access the project folder
- Install the necessary R dependencies
- Run the analysis (e.g. clean data and run models)


## Structure
The ```main.R``` script is the main entry point. It loads packages, sources functions, builds a drake plan and makes (runs) it. You can run the script by simply executing ```Rscript main.R``` in the terminal.

Description of the project structure:
- ```main.R```: is the main entry point and responsible for running the analysis.
- ```data/```: contains the raw data.
- ```subplans/```: contains the drake subplans used to build the main drake plan.
- ```functions/```: contains the functions used in the drake subplans. They usually start with ```my_```.

Description of additional resources used in the project:
- ```renv/```, ```renv.lock``` and ```.Rprofile```: are created by renv to setup the virtual environment.
- ```makefile```: is a set of useful commands, which can be accessed with ```make <command name>``` in the terminal.
