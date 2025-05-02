library(dplyr)
library(readr)
library(ggplot2)

# Read and combine all year summaries
files <- list.files(pattern = "^loss_summary_\\d{4}\\.csv$")
all_data <- lapply(files, read_csv)
combined <- bind_rows(all_data)

# Total loss per state
final_summary <- combined %>%
  group_by(st) %>%
  summarise(across(c(Tornado, Hail, Wind), sum, na.rm = TRUE))

# Save total loss table
write.csv(final_summary, "total_loss_by_state.csv", row.names = FALSE)

