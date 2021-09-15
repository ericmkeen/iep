################################################################################
################################################################################
# Demo of using resources in 'iep' repo
################################################################################
################################################################################

# Load libraries
library(rstudioapi)
library(readr)
library(dplyr)

# Set wd
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Source functions from other R code
source('functions.R')

################################################################################
# Load data

plastics <- read_csv('https://raw.githubusercontent.com/ericmkeen/iep/main/data/plastics-2021.csv')
head(plastics)
View(plastics)

transects <- read_csv('https://raw.githubusercontent.com/ericmkeen/iep/main/data/transects-2021.csv')
head(transects)
View(transects)

################################################################################
# Map data

map_stcats()
points(transects$longitude,
       transects$latitude,
       col='red')






