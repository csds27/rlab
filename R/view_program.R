view_program <- function() {
  programs <- setNames(paste0("prog", 1:10, ".R"), as.character(1:10))

  find_file <- function(fname) {
    p <- system.file("programs", fname, package = "rlab")
    if (nzchar(p) && file.exists(p)) return(p)
    p2 <- file.path("inst", "programs", fname)
    if (file.exists(p2)) return(p2)
    NA_character_
  }

  menu_text <- paste0(
"======================================\n",
"   Program Index\n",
"======================================\n\n",
"1. Arithmetic Operation, Looping, Conditionals\n",
"2. Creating and Manipulating Data Structures\n",
"3. Basic Statistical Operations on Datasets\n",
"4. Data Import, Cleaning, and Export\n",
"5. Advanced dplyr Manipulation and Grouping\n",
"6. Data Visualization with ggplot2\n",
"7. Linear and Multiple Regression Analysis\n",
"8. K-Means Clustering and PCA\n",
"9. Time Series Analysis (ARIMA, Decomposition)\n\n",
"10. Interactive Visualisation with plotly and dynamic reports with R-Markdown\n",
"0. Exit\n",
"======================================\n"
  )

  repeat {
    cat(menu_text)
    choice <- readline("\nEnter program number to view (or 0 to exit): ")

    if (choice == "0") {
      cat("Exiting...\n")
      break
    }

    if (!choice %in% names(programs)) {
      cat("Invalid selection. Try 1-10 or 0 to exit.\n\n")
      next
    }

    fname <- programs[[choice]]
    file_path <- find_file(fname)

    if (is.na(file_path)) {
      cat(sprintf("Program file '%s' not found. Make sure inst/programs/%s exists or the package is installed.\n\n",
                  fname, fname))
      next
    }

    cat("\n------------------------------------------------\n")
    cat(sprintf(" CODE FOR PROGRAM %s (%s)\n", choice, file_path))
    cat("------------------------------------------------\n")

    tryCatch({
      code <- readLines(file_path, warn = FALSE)
      cat(paste(code, collapse = "\n"), "\n")
    }, error = function(e) {
      cat("Error reading file:", e$message, "\n")
    })

    cat("------------------------------------------------\n")
    readline("Press Enter to return to menu...")
    cat("\n")
  }
}
