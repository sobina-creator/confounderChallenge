# Install required R packages for Quarto
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Get user library path
userLibPath <- file.path(Sys.getenv("USERPROFILE"), "Documents", "R", "win-library", 
                         paste(R.version$major, strsplit(R.version$minor, "\\.")[[1]][1], sep = "."))

# Create directory if it doesn't exist
if (!dir.exists(userLibPath)) {
  dir.create(userLibPath, recursive = TRUE)
}

cat("Installing to:", userLibPath, "\n")

cat("Installing knitr...\n")
install.packages("knitr", lib = userLibPath, dependencies = TRUE)

cat("Installing rmarkdown...\n")
install.packages("rmarkdown", lib = userLibPath, dependencies = TRUE)

cat("Verification:\n")
cat("knitr:", ifelse(require("knitr", lib.loc = userLibPath, quietly = TRUE), "INSTALLED", "FAILED"), "\n")
cat("rmarkdown:", ifelse(require("rmarkdown", lib.loc = userLibPath, quietly = TRUE), "INSTALLED", "FAILED"), "\n")

