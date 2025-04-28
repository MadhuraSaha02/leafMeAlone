#' Create interactive map of canopy change
#'
#' Creates a simple interactive map showing canopy change (loss/no change vs. gain).
#'
#' @param change_raster A raster layer where 0 represents no change/loss and 1 represents canopy gain.
#'
#' @return An interactive Leaflet map.
#' @export
leaflet_change_map <- function(change_raster) {
  leaflet::leaflet() %>%
    leaflet::addTiles() %>%
    leaflet::addRasterImage(change_raster, colors = c("gray", "green"), opacity = 0.7) %>%
    leaflet::addLegend("bottomright", colors = c("gray", "green"),
                       labels = c("No Change", "Gain"),
                       title = "Canopy Change")
}
