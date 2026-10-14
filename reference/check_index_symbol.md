# Check Confidence Index Symbol

This function validates the symbol input.

## Usage

``` r
check_index_symbol(symbol)
```

## Arguments

- symbol:

  A string with a Confidence Index symbol:

  - *US1YI*: U.S. One-Year Confidence Index

  - *USVI*: U.S. Valuation Confidence Index

  - *USBODI*: U.S. Buy-On-Dips Confidence Index

  - *USCI*: U.S. Crash Confidence Index

## Value

A string with the `symbol` or an error if it is not found.

## See also

[`US_confidence_indices`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices.md)

[`US_confidence_indices_url`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices_url.md)

## Examples

``` r
check_index_symbol("USVI")
#> [1] "USVI"
```
