
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

multireport(rmarkdown_file = "report.Rmd",
            param_all_options = fivethirtyeight::bad_drivers$state,
            param_name = "state",
            report_format = "html_document",
            report_suffix = "report",
            report_output_dir = "reports")
```

This will generate a series of reports in the report folder.
