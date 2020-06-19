
# multireport

<!-- badges: start -->

<!-- badges: end -->

[Parameterized
reporting](https://medium.com/@urban_institute/iterated-fact-sheets-with-r-markdown-d685eb4eafce)
is powerful but complicated. This package makes it simpler by providing
a single function — [`multireport()`](reference/multireport.html) — to
simplify the processing.

## Installation

You can install the package from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("dgkeyes/multireport")
```

## Example

This shows how to make multiple reports using the
[`multireport()`](reference/multireport.html) function:

``` r
library(multireport)

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
```

This will generate a series of reports in the inst/reports folder.
