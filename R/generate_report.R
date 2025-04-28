#' Generate report
#'
#' Generates an HTML report for a specified area of interest.
#'
#' @param aoi_name Name of the area of interest (used in the report filename).
#' @export
generate_report <- function(aoi_name) {
  rmarkdown::render(system.file("inst", "report_template.Rmd", package = "leafMeAlone"),
                    output_file = paste0("canopy_report_", aoi_name, ".html"),
                    params = list(name = aoi_name))
}
