# Get confidence index data from Yale School of Management's web

Stock market confidence indexes are derived from survey data on the
behavior of U.S. investors.

## Usage

``` r
get_index(symbol = "US1YI")
```

## Arguments

- symbol:

  A string with a Confidence Index symbol:

  - *US1YI*: U.S. One-Year Confidence Index

  - *USVI*: U.S. Valuation Confidence Index

  - *USBODI*: U.S. Buy-On-Dips Confidence Index

  - *USCI*: U.S. Crash Confidence Index

## Value

A `data.frame` with columns `Date` (last day of the survey month),
`<symbol>.Value`, `<symbol>.StdErr` and `Investor` (factor: "Individual"
or "Institutional"), sorted by date.

## Note

The default value for `symbol` is "US1YI".

## References

*Yale School of Management*, International Center for Finance: [Stock
Market Confidence
Indices](https://som.yale.edu/faculty-research/our-centers-initiatives/international-center-finance/data/stock-market-confidence)

Stock Market Confidence Indices: [Terms of
Use](https://som.yale.edu/centers/international-center-for-finance/data/stock-market-confidence-indices/united-states)

## See also

[`US_confidence_indices`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices.md)

[`US_confidence_indices_url`](https://enriqueph.github.io/marketconf/reference/US_confidence_indices_url.md)

[`get_index_description`](https://enriqueph.github.io/marketconf/reference/get_index_description.md)

[`get_index_info`](https://enriqueph.github.io/marketconf/reference/get_index_info.md)

[`check_index_symbol`](https://enriqueph.github.io/marketconf/reference/check_index_symbol.md)

## Examples

``` r
if (FALSE) { # \dontrun{
get_index("USCI")
} # }
```
