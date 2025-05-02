#!/bin/bash

# Create folders
mkdir -p extracted_torn_data extracted_hail_data extracted_wind_data

# Tornado data
wget -O 1950-2023_torn.csv.zip "https://www.spc.noaa.gov/wcm/data/1950-2023_torn.csv.zip"
unzip -o 1950-2023_torn.csv.zip -d extracted_torn_data

# Hail data
wget -O 1955-2023_hail.csv.zip "https://www.spc.noaa.gov/wcm/data/1955-2023_hail.csv.zip"
unzip -o 1955-2023_hail.csv.zip -d extracted_hail_data

# Wind data
wget -O 1955-2023_wind.csv.zip "https://www.spc.noaa.gov/wcm/data/1955-2023_wind.csv.zip"
unzip -o 1955-2023_wind.csv.zip -d extracted_wind_data

echo "All files downloaded and extracted."
