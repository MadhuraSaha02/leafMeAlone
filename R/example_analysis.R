#' Run the full example analysis
#'
#' Runs a complete example analysis, including phenology mapping and single-pixel analysis.
#'
#' @export
run_example_analysis <- function() {
  ndvi_stack <- terra::rast(system.file("extdata", "ndvi_stack.tif", package = "leafMeAlone"))
  dates <- as.Date(scan(system.file("extdata", "ndvi_dates.txt", package = "leafMeAlone"), what = "character"))

  onset_map <- phenology_map(ndvi_stack, dates)
  plot(onset_map, main = "Estimated Autumn Onset (DOY)")

  pixel_ndvi <- as.numeric(terra::extract(ndvi_stack, matrix(c(500, 500), ncol = 2)))
  phen <- extract_phenology_metrics(pixel_ndvi, dates)
  plot_phenology_curve(phen$ndvi_curve, phen$autumn_onset_doy)
}
