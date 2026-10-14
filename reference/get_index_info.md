# Find Confidence Index information

Find Confidence Index information

## Usage

``` r
get_index_info(symbol = "US1YI")
```

## Arguments

- symbol:

  A string with a Confidence Index symbol:

  - *US1YI*: U.S. One-Year Confidence Index

  - *USVI*: U.S. Valuation Confidence Index

  - *USBODI*: U.S. Buy-On-Dips Confidence Index

  - *USCI*: U.S. Crash Confidence Index

## Value

A string with the Confidence Index information

## Note

The default value for `symbol` is "US1YI".

## See also

[`US_confidence_indices`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices.md)

[`get_index`](https://enriqueph.github.io/marketconf/reference/get_index.md)

[`get_index_description`](https://enriqueph.github.io/marketconf/reference/get_index_description.md)

[`check_index_symbol`](https://enriqueph.github.io/marketconf/reference/check_index_symbol.md)

## Examples

``` r
get_index_info("USCI")
#> [1] "The percent of the population who attach little probability to a stock market crash in the next six months."
```
