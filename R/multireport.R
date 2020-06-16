#' Generate multiple reports using parameterized reporting
#'
#' A function to simply parameterized reporting
#'
#' @param rmarkdown_file The RMarkdown file to be rendered
#' @param params_data_frame A data frame with all of the parameter options (each variable name is the name of a parameter and all of the rows in that column are the parameter options)
#' @param report_format The format of the report (html_document, pdf_document, word_document, etc)
#' @param report_prefix Text to be put before the file names of rendered reports
#' @param report_suffix Text to be put fterfile names of rendered reports
#' @param report_output_dir The name of the directory where the reports will be rendered to
#'
#' @return
#' @export
#'
#' @examples
multireport <- function(rmarkdown_file,
                        params_data_frame,
                        report_format = "html_document",
                        report_prefix = "",
                        report_suffix = "",
                        report_output_directory = here::here()) {

  reports <- tibble::tibble(
    output_format = report_format,
    output_file = stringr::str_glue("{report_prefix}{stringr::str_to_lower(params_data_frame[[1]])}{report_suffix}"),
    output_dir = report_output_directory,
    params = purrr::pmap(params_data_frame,
                         list))

  purrr::pwalk(reports,
               rmarkdown::render,
               input = rmarkdown_file)
}
