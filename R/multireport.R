#' Title
#'
#' @param rmarkdown_file
#' @param params_all_options
#' @param param_name
#' @param report_format
#' @param report_suffix
#'
#' @return
#' @export
#'
#' @examples
#' multireport(rmarkdown_file = "inst/report.Rmd",
#' params_all_options = fivethirtyeight::bad_drivers$state,
#' param_name = "state",
#' report_format = "html_document",
#' report_suffix = "report",
#' report_output_dir = "inst")
multireport <- function(rmarkdown_file,
                        params_all_options,
                        param_name,
                        report_format = "html_document",
                        report_suffix = "report",
                        report_output_dir = "inst") {

  reports <- tibble::tibble(
    output_format = report_format,
    output_file = stringr::str_glue("{params_all_options}-{report_suffix}"),
    output_dir = report_output_dir,
    params = purrr::map(params_all_options, ~list(setNames(list(.), param_name)))
  ) %>%
    tidyr::unnest(params)

  # return(reports)

  purrr::pwalk(reports,
               rmarkdown::render,
               input = rmarkdown_file)
}
