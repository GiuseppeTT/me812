FROM rocker/tidyverse:latest

ARG PROJECT_PATH=home/rstudio/me812/

COPY . $PROJECT_PATH

RUN true \
    && cd $PROJECT_PATH \
    && make dependencies

WORKDIR $PROJECT_PATH
