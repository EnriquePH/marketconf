<!-- badges: start -->

[![R-CMD-check](https://github.com/EnriquePH/marketconf/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/EnriquePH/marketconf/actions/workflows/R-CMD-check.yaml)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/EnriquePH/marketconf?branch=master&svg=true)](https://ci.appveyor.com/project/EnriquePH/marketconf)
![License](https://img.shields.io/:license-mit-blue.svg)

<!-- badges: end -->
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Package `marketconf`: Stock Market Confidence Indexes

The R package `marketconf` reads data on **U. S. Stock Market Confidence
Indexes** from the [Yale School of Management’s International Center for
Finance](https://som.yale.edu/faculty-research/our-centers-initiatives/international-center-finance/data/stock-market-confidence)
web page.

This package is designed for stock market prediction and risk valuation,
and it is compatible with other packages like:

[`quantmod`](https://cran.r-project.org/web/packages/quantmod/index.html),
[`TTR`](https://cran.r-project.org/web/packages/TTR/index.html) or
[`tidyquant`](https://cran.r-project.org/web/packages/tidyquant/index.html)

## Package installation

``` r
library(devtools)
devtools::install_github("EnriquePH/marketconf")
```

## Examples

### Listing confidence indices

The four U.S. stock market confidence indexes are derived monthly from
survey data on investors’ behavior. These indexes are:

``` r
library(marketconf)
library(knitr)
kable(US_confidence_indices())
```

| Symbol | Dir                                     | Description                       | Info                                                                                                        | Url                                                                                        |
|:--|:----------|:---------|:--------------------------|:----------------------|
| US1YI  | united-states-one-year-index            | U.S. One Year Confidence Index    | The percent of the population expecting an increase in the Dow in the coming year.                          | <https://shiller-data-public.s3.amazonaws.com/icf_stock_market_confidence_index_table.csv> |
| USVI   | united-states-valuation-index           | U.S. Valuation Confidence Index   | The percent of the population who think that the market is not too high.                                    | <https://shiller-data-public.s3.amazonaws.com/icf_stock_market_valuation_index_table.csv>  |
| USBODI | united-states-buy-dips-confidence-index | U.S. Buy-On-Dips Confidence Index | The percent of the population expecting a rebound the next day should the market ever drop 3% in one day.   | <https://shiller-data-public.s3.amazonaws.com/icf_stock_market_dips_index_table.csv>       |
| USCI   | us-crash-confidence-index               | U.S. Crash Confidence Index       | The percent of the population who attach little probability to a stock market crash in the next-six months. | <https://shiller-data-public.s3.amazonaws.com/icf_stock_market_crash_index_table.csv>      |

### Plotting

This is a basic example that plots the **U.S. Valuation Index**:

``` r
library(ggplot2)

index_symbol <- "USVI"
index_df <- get_index(index_symbol)

ggplot(index_df, aes(x = Date, y = USVI.Value, color = Investor)) +
  geom_line() +
  ggtitle(get_index_description(index_symbol))
```

![](README-example-1.png)

## License

The `markerconf` package is licensed under the **MIT License (MIT)**,
but the **Stock Market Confidence Indexes** are produced and copyrighted
by the **International Center of Finance at the Yale School of
Management**. Please refer to the [TERMS OF
USE](https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices/united-states)
on [Yale University](https://som.yale.edu/)’s web page for further
information.
