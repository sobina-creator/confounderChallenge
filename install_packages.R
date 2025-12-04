# Set CRAN repository
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Determine user library path
userLib <- file.path(Sys.getenv("USERPROFILE"), "Documents", "R", "win-library", 
                     paste(R.version$major, strsplit(R.version$minor, "\\.")[[1]][1], sep = "."))

# Create directory if needed
if (!dir.exists(userLib)) {
  dir.create(userLib, recursive = TRUE)
  cat("Created library directory:", userLib, "\n")
}

# Add to library paths
.libPaths(c(userLib, .libPaths()))

cat("Installing packages to:", userLib, "\n")
cat("Library paths:", paste(.libPaths(), collapse = "\n"), "\n\n")

# Install knitr
cat("Installing knitr...\n")
tryCatch({
  install.packages("knitr", lib = userLib, dependencies = TRUE)
  cat("knitr installed successfully\n")
}, error = function(e) {
  cat("Error installing knitr:", e$message, "\n")
})

# Install rmarkdown
cat("\nInstalling rmarkdown...\n")
tryCatch({
  install.packages("rmarkdown", lib = userLib, dependencies = TRUE)
  cat("rmarkdown installed successfully\n")
}, error = function(e) {
  cat("Error installing rmarkdown:", e$message, "\n")
})

# Verify installation
cat("\nVerification:\n")
cat("knitr available:", require("knitr", lib.loc = userLib, quietly = TRUE), "\n")
cat("rmarkdown available:", require("rmarkdown", lib.loc = userLib, quietly = TRUE), "\n")

