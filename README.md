
# multireport

<!-- badges: start -->

<!-- badges: end -->

Parameterized reporting is powerful but complicated. This package makes
it simpler by providing a single function —
[`multireport()`](reference/multireport.html) — to simplify the
processing.

## Installation

You can install the package from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dgkeyes/multireport")
```

## Example

This shows how to make multiple reports using the
[`multireport()`](reference/multireport.html) function:

``` r
library(multireport)

baddrivers_params <- tibble::tibble(
  state = fivethirtyeight::bad_drivers$state,
  losses = fivethirtyeight::bad_drivers$losses
)

multireport(rmarkdown_file = "report.Rmd",
            params_data_frame = baddrivers_params,
            report_format = "html_document",
            report_prefix = "",
            report_suffix = "",
            report_output_directory = "reports")
```

This will generate a series of reports in the reports folder.
