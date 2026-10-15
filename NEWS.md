# marketconf 1.0.2

* First CRAN submission.
* `get_index()` now fails gracefully: if the data cannot be downloaded it shows
  an informative message and returns `NULL` invisibly.
* `check_index_symbol()` validates that `symbol` is a single character string.
* `get_index()` returns end-of-month `Date` values and sorted data.
