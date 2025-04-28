#' Calculate NDVI from raster bands
#'
#' Computes the Normalized Difference Vegetation Index (NDVI) from a raster image,
#' highlighting vegetation greenness.
#'
#' @param image A raster object (e.g., `RasterLayer`, `RasterStack`, or `SpatRaster`).
#' @param nir_band The band number representing the Near-Infrared (NIR) channel.
#' @param red_band The band number representing the Red channel.
#'
#' @return A raster object containing the calculated NDVI values, named "NDVI".
#' @export
calculate_ndvi <- function(image, nir_band, red_band) {
  nir <- image[[nir_band]]
  red <- image[[red_band]]
  ndvi <- (nir - red) / (nir + red)
  names(ndvi) <- "NDVI"
  return(ndvi)
}
