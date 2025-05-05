#' Extract autumn phenology metrics
#'
#' Extracts autumn phenology metrics (autumn onset day of year) from an NDVI time series.
#'
#' @param ndvi_ts A numeric vector of NDVI values.
#' @param dates A vector of corresponding dates.
#'
#' @return A list containing:
#'   - `autumn_onset_doy`: The day of year of autumn onset.
#'   - `ndvi_curve`: A data frame with dates, NDVI, and smoothed NDVI.
#' @export
extract_phenology_metrics <- function(ndvi_ts, dates) {
  if (all(is.na(ndvi_ts)) || length(ndvi_ts) < 3) {
    return(list(autumn_onset_doy = NA, ndvi_curve = data.frame(date = dates, ndvi = ndvi_ts)))
  }

  df <- data.frame(date = dates, ndvi = ndvi_ts)
  df$doy <- as.numeric(format(df$date, "%j"))
  df$ndvi_smooth <- zoo::rollmean(df$ndvi, k = 3, fill = NA, align = "center")

  if (all(is.na(df$ndvi_smooth))) {
    return(list(autumn_onset_doy = NA, ndvi_curve = df))
  }

  d_ndvi <- diff(df$ndvi_smooth)
  min_slope_idx <- which.min(d_ndvi)

  if (length(min_slope_idx) == 0 || is.na(min_slope_idx)) {
    return(list(autumn_onset_doy = NA, ndvi_curve = df))
  }

  autumn_onset_doy <- df$doy[min_slope_idx + 1]
  return(list(autumn_onset_doy = autumn_onset_doy, ndvi_curve = df))
}
