# R/example_analysis.R

run_example_analysis <- function(file_path_before, file_path_after, nir_band = 8, red_band = 4) {
  
  library(leafMeAlone)
  library(terra)
  library(leaflet)
  library(ggplot2)
  
  # 1. Load Sentinel-2 Images
  cat("Loading satellite images...\n")
  data_list <- download_satellite_data(file_path_before, file_path_after)
  img_before <- data_list$img2018
  img_after <- data_list$img2023
  
  # 2. Calculate NDVI for both
  cat("Calculating NDVI...\n")
  ndvi_before <- calculate_ndvi(img_before, nir_band, red_band)
  ndvi_after <- calculate_ndvi(img_after, nir_band, red_band)
  
  # 3. Classify canopy
  cat("Classifying canopy cover...\n")
  canopy_before <- classify_canopy(ndvi_before)
  canopy_after <- classify_canopy(ndvi_after)
  
  # 4. Detect canopy change
  cat("Detecting canopy change...\n")
  change_map <- detect_canopy_change(canopy_before, canopy_after)
  
  # 5. Visualize the change map
  cat("Plotting change map...\n")
  print(
    leaflet_change_map(change_map)
  )
  
  # 6. Save the raster (optional)
  cat("Saving change raster...\n")
  terra::writeRaster(change_map, "canopy_change.tif", overwrite = TRUE)
  
  # 7. (Optional) Phenology analysis — if you have NDVI time series
  # (You can add a separate function for this if you load a stack of images)
  
  cat("Analysis complete!\n")
}
