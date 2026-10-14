# Get Confidence Index symbol url

Get Confidence Index symbol url

## Usage

``` r
US_confidence_indices_url(symbol = "US1YI")
```

## Arguments

- symbol:

  A string with a Confidence Index symbol:

  - *US1YI*: U.S. One-Year Confidence Index

  - *USVI*: U.S. Valuation Confidence Index

  - *USBODI*: U.S. Buy-On-Dips Confidence Index

  - *USCI*: U.S. Crash Confidence Index

## Value

A string with the **Yale School of Management**'s web page symbol url

## Note

The default value for `symbol` is "US1YI".

## See also

[`US_confidence_indices`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices.md)

[`get_index_description`](https://enriqueph.github.io/marketconf/reference/get_index_description.md)

[`get_index_info`](https://enriqueph.github.io/marketconf/reference/get_index_info.md)

[`get_index`](https://enriqueph.github.io/marketconf/reference/get_index.md)

## Examples

``` r
US_confidence_indices_url("USCI")
#> [1] "https://shiller-data-public.s3.amazonaws.com/icf_stock_market_crash_index_table.csv"
```
