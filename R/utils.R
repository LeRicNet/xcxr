registerShiny <- function(shiny_directory) {
  shiny_directory <- normalizePath(shiny_directory)
  application_name <- rev(unlist(strsplit(shiny_directory, split = "/")))[1]
  R.utils::copyDirectory(
    from = shiny_directory,
    to = paste0("/srv/shiny-server/", application_name)
  )
}