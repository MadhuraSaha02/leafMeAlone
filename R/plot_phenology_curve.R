#' Plot the phenology curve
#'
#' Plots the autumn phenology curve (smoothed NDVI) with the autumn onset day of year.
#'
#' @param curve_data A data frame with 'day_of_year' and 'ndvi_smooth' columns.
#' @param onset_doy The day of year of autumn onset.
#'
#' @return A ggplot2 plot.
#' @export
plot_phenology_curve <- function(curve_data, onset_doy) {
  ggplot2::ggplot(curve_data, ggplot2::aes(x = day_of_year, y = ndvi_smooth)) +
    ggplot2::geom_line(color = "darkgreen") +
    ggplot2::geom_vline(xintercept = onset_doy, linetype = "dashed", color = "orange") +
    ggplot2::labs(title = "Autumn Phenology", x = "Day of Year", y = "NDVI") +
    ggplot2::theme_minimal()
}
