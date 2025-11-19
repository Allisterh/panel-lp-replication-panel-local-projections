# syntax=docker/dockerfile:1.7
FROM jupyter/r-notebook:lab-4.2.4

USER root
RUN apt-get update ^
    && apt-get install -y --no-install-recommends ^
        libxml2-dev ^
        libssl-dev ^
        libcurl4-openssl-dev ^
        libcairo2-dev ^
        libxt6 ^
        libfontconfig1-dev ^
        libfreetype6-dev ^
        libpng-dev ^
        libtiff5-dev ^
        libjpeg-dev ^
    && apt-get clean ^
    && rm -rf /var/lib/apt/lists/*

RUN mamba install --yes ^
        "r-ggplot2" ^
        "r-reshape2" ^
        "r-ggpubr" ^
    && mamba clean --all -f -y

WORKDIR /home/jovyan/work
COPY . /home/jovyan/work
RUN fix-permissions "/home/${NB_USER}"

EXPOSE 8888