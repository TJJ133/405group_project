split_by_year <- function(data, year_col, weather_type, out_dir) {
  unique_years <- unique(data[[year_col]])
  for (yr in unique_years) {
    subset <- data[data[[year_col]] == yr, ]
    write.csv(subset, file = file.path(out_dir, paste0(yr, "_", weather_type, ".csv")), row.names = FALSE)
  }
}

# Load data
torn_data <- read.csv("extracted_torn_data/1950-2023_torn.csv")
hail_data <- read.csv("extracted_hail_data/1955-2023_hail.csv")
wind_data <- read.csv("extracted_wind_data/1955-2023_wind.csv")

# Split and save
split_by_year(torn_data, "yr", "torn", "extracted_torn_data")
split_by_year(hail_data, "yr", "hail", "extracted_hail_data")
split_by_year(wind_data, "yr", "wind", "extracted_wind_data")

cat("Done splitting by year.\n")
