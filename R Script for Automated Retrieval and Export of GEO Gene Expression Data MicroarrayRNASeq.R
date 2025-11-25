if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GEOquery")
BiocManager::install("Biobase")

library(GEOquery)
library(Biobase)

# Set GEO Series ID (change to desired GSE)
gse_id <- "GSE12345"

# Download GEO data
gse <- getGEO(gse_id, GSEMatrix = TRUE)

# Extract expression matrix
expression_data <- exprs(gse[[1]])

# Save to CSV
write.csv(expression_data, file = paste0("expression_matrix_", gse_id, ".csv"))
