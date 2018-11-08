#!/usr/bin/env Rscript
#
# run w/ Rscript like:
# Rscript create_info_site.R

REPOS="https://cran.us.r-project.org"
# =========================================================================
# === This script assumes you have already installed the infographiq package.
# === Here is the install process:
# === Install the infographiq R package and those it depends on.
# === You only need to do this once.
# =========================================================================
# install required packages

# 1) devtools
if (!require('devtools')) install.packages('devtools', repos="https://cran.us.r-project.org")

# 2) stuff from DESCRIPTION:
#    manually:
# install.packages(c("tidyverse", "stringr", "rmarkdown", "dygraphs", "xts", "lubridate", "geojsonio", "RColorBrewer", "leaflet", "crosstalk", "servr", "roxygen2", "futile.logger"))
#    using DESCRIPTION:
devtools::install("./", dependencies=TRUE, repos="https://cloud.r-project.org/")

# install infographiq from Github
devtools::install_github('marinebon/infographiq')


# =========================================================================
# === Load the library and create the site.
# =========================================================================
# load
library(infographiq)

# TODO: need this (or similar?)
# export RSTUDIO_PANDOC=/home/tylar/R/x86_64-pc-linux-gnu-library/3.4/pander/
Sys.setenv(RSTUDIO_PANDOC="/home/tylar/R/x86_64-pc-linux-gnu-library/3.4/pander/")

infographiq::create_info_site(
    render_modals = T,
    preview_site = F
)
