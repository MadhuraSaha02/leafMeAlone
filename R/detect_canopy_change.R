#' Detect canopy changes between two times
#'
#' Detects canopy changes (-1 = loss, 0 = no change, 1 = gain) between two binary
#' canopy cover rasters.
#'
#' @param canopy_before RasterLayer representing canopy cover at the earlier time.
#' @param canopy_after  RasterLayer representing canopy cover at the later time.
#'
#' @return A RasterLayer indicating canopy changes.
#' @export
detect_canopy_change <- function(canopy_before, canopy_after) {
  change <- canopy_after - canopy_before
  change_class <- terra::classify(change, rcl = matrix(c(-1, -1, -1,
                                                       0,  0,  0,
                                                       1,  1,  1),
                                                     ncol = 3, byrow = TRUE))
  names(change_class) <- "Change"
  return(change_class)
}
