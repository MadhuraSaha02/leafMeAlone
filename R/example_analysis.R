#' Run the full example analysis
#'
#' Runs a complete example analysis, including phenology mapping and single-pixel analysis.
#'
#' @export
run_example_analysis <- function() {
  data <- download_satellite_data()
  onset_map <- phenology_map(data$ndvi_stack, data$dates)
  plot(onset_map, main = "Autumn Onset - Vancouver")
  pixel_ndvi <- as.numeric(terra::extract(data$ndvi_stack, matrix(c(500, 500), ncol = 2)))
  phen <- extract_phenology_metrics(pixel_ndvi, data$dates)
  plot_phenology_curve(phen$ndvi_curve, phen$autumn_onset_doy)
}
