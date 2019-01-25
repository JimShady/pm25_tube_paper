rm(list=ls())

library(devtools)
library(nomisr)
library(tidyverse)
library(sf)

## Use nomisr to get data from NOMIS API . Want residents of London, who use the tube as their main means of going to work.
NOMIS_API_KEY <- '0x147e5cbb1f729792a8724b9b4bb42be99bc8f491'
nomis_api_key(check_env = FALSE)

# Think want table NM_1208_1 . Do some exploring of that ONS table
nomis_get_metadata("NM_1208_1", "USUAL_RESIDENCE", "TYPE")
nomis_get_metadata("NM_1208_1", "PLACE_OF_WORK", "TYPE")
nomis_get_metadata("NM_1208_1", "TRANSPORT_POWPEW11")
nomis_get_metadata("NM_1208_1", "MEASURES")
nomis_get_metadata("NM_1208_1", "FREQ")

# Going to download the data something like this, but need to re-work the query
nomis_get_data(id                 = "NM_1208_1",
               time               = "latest",
               USUAL_RESIDENCE    = "TYPE480", #480
               PLACE_OF_WORK      = "TYPE480", #480
               TRANSPORT_POWPEW11 = "2")

# Here are the MSOAs for London
uk_geojsons <- st_read('https://opendata.arcgis.com/datasets/826dc85fb600440889480f4d9dbb1a24_0.geojson')
