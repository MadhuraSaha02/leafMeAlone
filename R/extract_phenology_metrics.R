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
  df <- data.frame(date = as.Date(dates), ndvi = ndvi_ts)
  df$doy <- as.numeric(format(df$date, "%j"))
  df$ndvi_smooth <- zoo::rollmean(df$ndvi, k = 3, fill = NA)
  onset_idx <- which.min(diff(df$ndvi_smooth))
  list(autumn_onset_doy = df$doy[onset_idx], ndvi_curve = df)
}
