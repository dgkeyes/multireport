library(multireport)
library(tidyverse)
library(fs)

parameters <- tibble(
  state = unique(fivethirtyeight::bad_drivers$state),
  losses = unique(fivethirtyeight::bad_drivers$losses)
)

multireport(rmarkdown = "inst/report.Rmd",
            params_data_frame = parameters,
            report_title_param = "state",
            report_suffix = "-report",
            report_title_to_lower = TRUE,
            report_format = "html_document",
            report_output_directory = "inst/reports/")
