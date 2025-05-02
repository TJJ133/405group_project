args <- commandArgs(trailingOnly = TRUE)
year <- args[1]

# Construct file paths
torn_file <- paste0(year, "_torn.csv")
hail_file <- paste0(year, "_hail.csv")
wind_file <- paste0(year, "_wind.csv")

# Read and tag data
torn <- read.csv(torn_file)
hail <- read.csv(hail_file)
wind <- read.csv(wind_file)

torn$type <- "Tornado"
hail$type <- "Hail"
wind$type <- "Wind"

# Combine
all_data <- rbind(torn[, c("st", "loss", "type")],
                  hail[, c("st", "loss", "type")],
                  wind[, c("st", "loss", "type")])

# Summarize
library(dplyr)
summary <- all_data %>%
  group_by(st, type) %>%
  summarise(total_loss = sum(loss, na.rm = TRUE), .groups = "drop") %>%
  tidyr::pivot_wider(names_from = type, values_from = total_loss, values_fill = 0)

# Save
output_file <- paste0("loss_summary_", year, ".csv")
write.csv(summary, output_file, row.names = FALSE)
