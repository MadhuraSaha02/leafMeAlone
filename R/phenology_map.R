#' Create autumn onset map
#'
#' Creates a raster layer of autumn onset day of year from an NDVI raster stack.
#'
#' @param ndvi_stack An NDVI raster stack.
#' @param date_vector A vector of corresponding dates.
#'
#' @return A RasterLayer representing the autumn onset day of year.
#' @export
phenology_map <- function(ndvi_stack, date_vector) {
  onset_map <- terra::app(ndvi_stack, fun = function(ts) {
    if (all(is.na(ts))) return(NA)
    smooth_ts <- zoo::rollmean(ts, k = 3, fill = NA)
    onset_idx <- which.min(diff(smooth_ts))
    if (length(onset_idx) == 0) return(NA)
    as.numeric(format(as.Date(date_vector[onset_idx]), "%j"))
  })
  names(onset_map) <- "autumn_onset"
  return(onset_map)
}
