FROM rocker/tidyverse:latest

COPY . home/rstudio/me812/

# RUN true \
#     && git clone --recurse-submodules https://github.com/GiuseppeTT/me812.git home/rstudio/me812 \
#     && cd /home/rstudio/me812 \
#     && make dependencies

WORKDIR /home/rstudio/me812
