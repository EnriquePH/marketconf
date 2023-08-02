## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  library(devtools)
#  devtools::install_github("EnriquePH/marketconf")

## -----------------------------------------------------------------------------
library(marketconf)
library(knitr)
kable(US_confidence_indices())

## -----------------------------------------------------------------------------
index_symbol <- "USBODI"
get_index_description(index_symbol)

## -----------------------------------------------------------------------------
index_symbol <- "USBODI"
get_index_info(index_symbol)

## -----------------------------------------------------------------------------
index_df <- get_index(index_symbol)
kable(head(index_df))

## ----example------------------------------------------------------------------
library(ggplot2)

index_symbol <- "USVI"
index_df <- get_index(index_symbol)

ggplot(index_df, aes(x = Date, y = USVI.Value, color = Investor)) +
  geom_line() +
  ggtitle(get_index_description(index_symbol))
