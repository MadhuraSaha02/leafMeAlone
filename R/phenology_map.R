#' Create autumn onset map
#'
#' Creates a raster layer of autumn onset day of year from an NDVI raster stack.
#'
#' @param ndvi_stack An NDVI raster stack.
#' @param date_vector A vector of corresponding dates.
#'
#' @return A RasterLayer representing the autumn onset day of year.
#' @export
phenology_map <- function(onset_map) {
  if (is.null(onset_map) || terra::is.empty(onset_map)) {
    warning("onset_map is empty or invalid; cannot plot.")
    return(NULL)
  }

  pal <- colorNumeric(palette = "YlOrRd", domain = values(onset_map), na.color = "transparent")

  leaflet() %>%
    addTiles() %>%
    addRasterImage(onset_map, colors = pal, opacity = 0.8) %>%
    addLegend(pal = pal, values = values(onset_map),
              title = "Autumn Onset DOY") %>%
    setView(lng = mean(ext(onset_map)[1:2]), lat = mean(ext(onset_map)[3:4]), zoom = 10)
}
