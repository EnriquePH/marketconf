# Changelog

## marketconf 1.0.2

- First CRAN submission.
- [`get_index()`](https://enriqueph.github.io/marketconf/reference/get_index.md)
  now fails gracefully: if the data cannot be downloaded it shows an
  informative message and returns `NULL` invisibly.
- [`check_index_symbol()`](https://enriqueph.github.io/marketconf/reference/check_index_symbol.md)
  validates that `symbol` is a single character string.
- [`get_index()`](https://enriqueph.github.io/marketconf/reference/get_index.md)
  returns end-of-month `Date` values and sorted data.
