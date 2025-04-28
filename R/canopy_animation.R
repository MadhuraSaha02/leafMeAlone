#' Create canopy change animation
#'
#' Creates a GIF animation from an NDVI raster stack.
#'
#' @param ndvi_stack An NDVI raster stack.
#' @param output_path File path to save the generated GIF (default: "canopy_change.gif").
#' @export
create_canopy_animation <- function(ndvi_stack, output_path = "canopy_change.gif") {
  png_files <- purrr::map_chr(1:nlyr(ndvi_stack), function(i) {
    png_file <- tempfile(fileext = ".png")
    png(png_file)
    plot(ndvi_stack[[i]], main = paste("NDVI -", names(ndvi_stack)[i]))
    dev.off()
    png_file
  })
  gifski::gifski(png_files, gif_file = output_path, width = 600, height = 600, delay = 0.5)
}
