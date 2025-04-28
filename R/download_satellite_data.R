#' Download Vancouver Sentinel-2 NDVI data (already prepared)
#'
#' @return list of NDVI raster and dates
#' @export
download_satellite_data <- function() {
  list(
    ndvi_stack = terra::rast(system.file("extdata", "vancouver_ndvi_stack.tif", package = "leafMeAlone")),
    dates = as.Date(scan(system.file("extdata", "vancouver_ndvi_dates.txt", package = "leafMeAlone"), what = "character"))
  )
}
