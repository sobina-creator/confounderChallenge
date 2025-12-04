options(repos = "https://cloud.r-project.org")

userLib <- file.path(Sys.getenv("USERPROFILE"), "Documents", "R", "win-library", "4.5")

if (!dir.exists(userLib)) {
  dir.create(userLib, recursive = TRUE)
}

cat("Installing knitr to:", userLib, "\n")
result1 <- tryCatch({
  install.packages("knitr", lib = userLib, dependencies = FALSE)
  "SUCCESS"
}, error = function(e) {
  cat("ERROR:", conditionMessage(e), "\n")
  "FAILED"
})

cat("knitr installation:", result1, "\n\n")

cat("Installing rmarkdown to:", userLib, "\n")
result2 <- tryCatch({
  install.packages("rmarkdown", lib = userLib, dependencies = FALSE)
  "SUCCESS"
}, error = function(e) {
  cat("ERROR:", conditionMessage(e), "\n")
  "FAILED"
})

cat("rmarkdown installation:", result2, "\n")

