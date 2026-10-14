# US confidence indices data.frame

US confidence indices data.frame

## Usage

``` r
US_confidence_indices()
```

## Value

A `data.frame` with symbols and urls from **Yale School of
Management**'s web page.

## References

*Yale School of Management*, International Center for Finance: [Stock
Market Confidence
Indices](https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices)

Stock Market Confidence Indices: [Terms of
Use](https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices/united-states)

## See also

[`US_confidence_indices_url`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices_url.md)

[`get_index`](https://enriqueph.github.io/marketconf/reference/get_index.md)

[`get_index_description`](https://enriqueph.github.io/marketconf/reference/get_index_description.md)

[`get_index_info`](https://enriqueph.github.io/marketconf/reference/get_index_info.md)

## Examples

``` r
US_confidence_indices()
#>   Symbol                                     Dir
#> 1  US1YI            united-states-one-year-index
#> 2   USVI           united-states-valuation-index
#> 3 USBODI united-states-buy-dips-confidence-index
#> 4   USCI               us-crash-confidence-index
#>                         Description
#> 1    U.S. One Year Confidence Index
#> 2   U.S. Valuation Confidence Index
#> 3 U.S. Buy-On-Dips Confidence Index
#> 4       U.S. Crash Confidence Index
#>                                                                                                          Info
#> 1                          The percent of the population expecting an increase in the Dow in the coming year.
#> 2                                    The percent of the population who think that the market is not too high.
#> 3   The percent of the population expecting a rebound the next day should the market ever drop 3% in one day.
#> 4 The percent of the population who attach little probability to a stock market crash in the next six months.
#>                                                                                        Url
#> 1 https://shiller-data-public.s3.amazonaws.com/icf_stock_market_confidence_index_table.csv
#> 2  https://shiller-data-public.s3.amazonaws.com/icf_stock_market_valuation_index_table.csv
#> 3       https://shiller-data-public.s3.amazonaws.com/icf_stock_market_dips_index_table.csv
#> 4      https://shiller-data-public.s3.amazonaws.com/icf_stock_market_crash_index_table.csv
```
