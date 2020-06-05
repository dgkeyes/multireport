library(multireport)
library(tidyverse)

multireport(rmarkdown_file = "inst/report.Rmd",
            param_all_options = fivethirtyeight::bad_drivers$state,
            param_name = "state",
            report_format = "html_document",
            report_suffix = "report",
            report_output_dir = "inst")
