registerShiny <- function(shiny_directory) {
  R.utils::copyDirectory(
    from = shiny_directory,
    to = "/srv/shiny-server"
  )
}