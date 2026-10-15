## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission.

## Notes for CRAN

* The package downloads data from the public Yale School of Management
  confidence indices files hosted on Amazon S3. Functions that use the
  internet fail gracefully with an informative message when the resource is
  not available, and tests that need the internet are skipped on CRAN.
