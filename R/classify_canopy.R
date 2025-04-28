#' Classify canopy cover from NDVI
#'
#' Classifies canopy cover (binary: 0 = no canopy, 1 = canopy) from an NDVI raster
#' using a threshold.
#'
#' @param ndvi_raster A RasterLayer containing NDVI values.
#' @param threshold The NDVI threshold for classifying canopy cover (default: 0.4).
#'
#' @return A RasterLayer with canopy cover classification.
#' @export
classify_canopy <- function(ndvi_raster, threshold = 0.4) {
  canopy <- ndvi_raster > threshold
  names(canopy) <- "Canopy"
  return(canopy)
}
