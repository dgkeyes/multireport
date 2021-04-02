#' Generate multiple reports using parameterized reporting
#'
#' A function to simply parameterized reporting
#'
#' @param rmarkdown_file The RMarkdown file to be rendered
#' @param params_data_frame A data frame with all of the parameter options (each variable name is the name of a parameter and all of the rows in that column are the parameter options)
#' @param report_title_param The name (in quotes) or column number of the variable to be used to create report titles
#' @param report_prefix Text to be put before the file names of rendered reports
#' @param report_suffix Text to be put after names of rendered reports
#' @param report_format The format of the report (html_document, pdf_document, word_document, etc)
#' @param report_title_to_lower TRUE/FALSE (FALSE by default) whether you want the report file names to be lower case (e.g. alabama-report.html vs Alabama-Report.html)
#' @param report_output_directory The directory where the rendered reports should be placed
#'
#' @return
#' @export
#'
#' @examples
multireport <- function(rmarkdown_file,
                        params_data_frame,
                        report_title_param = 1,
                        report_prefix = "",
                        report_suffix = "",
                        report_title_to_lower = FALSE,
                        report_format = "all",
                        report_output_directory = here::here()) {

  reports <- tibble::tibble(
    output_format = report_format,
    output_file = stringr::str_glue("{report_prefix}{params_data_frame[[report_title_param]]}{report_suffix}"),
    output_dir = report_output_directory,
    params = purrr::pmap(params_data_frame,
                         list))

  if (report_title_to_lower == TRUE) {
    reports <- reports %>%
      dplyr::mutate(output_file = stringr::str_to_lower(output_file))
  }

  purrr::pwalk(reports,
               rmarkdown::render,
               input = rmarkdown_file)
}



