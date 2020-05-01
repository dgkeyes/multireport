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
multireport <- function(rmarkdown_file,
                        params_all_options,
                        param_name,
                        report_format = "html_document",
                        report_suffix = "report",
                        report_output_dir = "inst") {

  reports <- tibble::tibble(
    output_format = report_format,
    output_file = stringr::str_glue("{param_name}-{report_suffix}"),
    output_dir = report_output_dir,
    params = purrr::map(params_all_options, ~list(param_name = .))
  )

  reports %>%
    purrr::pwalk(rmarkdown::render,
                 input = rmarkdown_file)
}

