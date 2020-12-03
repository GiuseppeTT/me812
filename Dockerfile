FROM rocker/tidyverse:latest

ARG PROJECT_PATH=home/rstudio/me812/

COPY . $PROJECT_PATH

WORKDIR $PROJECT_PATH
