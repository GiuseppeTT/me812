# ME812

## Overview
This repository comprehends a class project of the courses ME712 and ME812. It was developed by the students Giuseppe Tinti Tomio (ME812), João Accorsi (ME712), Júlio Mendes (ME712), Nicholas Salgado (ME712) and Pedro Santos (ME812) under the supervision of Professor Mariana Motta. The project consists of performing a statistical analysis for the Professor Aquiles Neto, from Institute of Language Studies - University of Campinas. He studied the difference between Angola and Moçambique portuguese.

## Structure
The ```main.R``` script is the main entry point. It loads packages, source functions, build a drake plan and make (run) it. You can run the script by simply executing ```Rscript main.R``` in the terminal.

Quick description of some files and folders:
- ```main.R```: is the main entry point and responsible for running the analysis.
- ```data/```: contains the raw data.
- ```subplans/```: contains the drake subplans used to build the main drake plan.
- ```functions/```: contains the functions used in the drake subplans. They usually start with ```my_```.
