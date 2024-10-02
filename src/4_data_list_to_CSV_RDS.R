files <- list.files("L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/B Analysis/R/2. Datasets/individual", full.names = T)
files<-files[!file.info(files)$isdir]
print(files)

country_codes <- sapply(files, function(x) {
  parts <- strsplit(x, " - ")[[1]]
  last_part <- parts[length(parts)]
  country <- strsplit(last_part, "\\.")[[1]][1]
  return(country)
})

for (i in seq_along(files)) {
  data <- readRDS(files[i])
  
df_list <- lapply(names(data), function(var_name) {
  
  # Extract the table for the current variable
  var_table <- data[[var_name]]
  
  # Convert the table to a data frame
  var_df <- as.data.frame(var_table)
  
  # Extract the response labels from the row names
  response_labels <- var_df[, 1]
  
  # Extract the counts
  counts <- var_df[, "Freq"]
  
  # Create a new data frame with the desired structure
  data.frame(
    Question = var_name,
    Response = response_labels,
    Count = counts,
    stringsAsFactors = FALSE,
    country=paste0(country_codes[i])
  )
})

# Combine all individual data frames into one
final_df <- do.call(rbind, df_list)

#write rds
saveRDS(final_df, file=paste0("L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/B Analysis/R/2. Datasets/rds/",country_codes[i],".RDS"))
}

files2 <- list.files("L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/B Analysis/R/2. Datasets/rds", full.names = T)
files2<-files2[!file.info(files2)$isdir]
print(files2)

file_list <- lapply(files2, readRDS)

# Combine all the data frames using rbind
final_combined_df <- do.call(rbind, file_list)

saveRDS(final_combined_df, file = "L:/DonorMedicin/FORTE/E Internation Donor Perception Survey/B Analysis/R/2. Datasets/combined.RDS")
