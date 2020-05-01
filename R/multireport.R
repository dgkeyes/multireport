#' Generate multiple reports using parameterized reporting
#'
#' A function to simply parameterized reporting
#'
#' @param rmarkdown_file The RMarkdown file to be rendered
#' @param param_all_options All possible options for the parameter (e.g. all 50 states)
#' @param param_name The name of the parameter to be used for parameterized reporting
#' @param report_format The format of the report (html_document, pdf_document, word_document, etc)
#' @param report_suffix A prefix to be attached before the name of the parameter in the filename of each report rendered
#'
#' @return
#' @export
#'
#' @examples
#' multireport(rmarkdown_file = "inst/report.Rmd",
#' param_all_options = fivethirtyeight::bad_drivers$state,
#' param_name = "state",
#' report_format = "html_document",
#' report_suffix = "report",
#' report_output_dir = "inst")
multireport <- function(rmarkdown_file,
                        param_all_options,
                        param_name,
                        report_format = "html_document",
                        report_prefix = "report",
                        report_output_dir = "inst") {

  reports <- tibble::tibble(
    output_format = report_format,
    output_file = stringr::str_glue("{params_all_options}-{report_suffix}"),
    output_dir = report_output_dir,
    params = purrr::map(param_all_options, ~list(setNames(list(.), param_name)))
  ) %>%
    tidyr::unnest(params)

  purrr::pwalk(reports,
               rmarkdown::render,
               input = rmarkdown_file)
}
