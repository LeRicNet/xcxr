registerShiny <- function(shiny_directory) {
  shiny_directory <- normalizePath(shiny_directory)
  application_name <- rev(unlist(strsplit(shiny_directory, split = "/")))[1]
  target_directory <- paste0("/srv/shiny-server/", application_name)
  
  retries = 3
  success = FALSE
  while (retries > 0 & isFALSE(success)) {
    if (dir.exists(target_directory)) {
      response <- readline(prompt = "Directory found matching this application. Overwrite? [Y/N] ")
      if (response == "Y") {
        R.utils::copyDirectory(
          from = shiny_directory,
          to = target_directory
        )
        success = TRUE
      } else if (response == "N") {
        return()
      } else {
        retries <- retries - 1
        logging("Response not understood. Please try again.", TRUE, "error")
      }
    }
  }
  
}