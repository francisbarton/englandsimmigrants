## code to prepare `immigrants_orig` dataset goes here

library(dplyr)
library(readr)
library(here)
library(myrmidon) # remotes::install_github("francisbarton/myrmidon")


# CSV file downloaded from https://www.englandsimmigrants.com/browse/
# using the "Download all results for this search" button

coltypes <- paste0(
  "icfcc", # cols 1:5
  "ccccc", # cols 6:10 etc
  "ccccc",
  "ccffc",
  "cccii",
  "fiiii",
  "iiccc",
  "ccccc",
  "icccf",
  "cfcfD", # columns 20, 22, 46 and 48 should be date (D) but there are invalid
           # dates, so importing these as character (c) for now
  "fDfc"
)

immigrants_orig <- here::here(
  "data-raw",
  "englands_immigrants_orig.csv"
) %>%
  readr::read_csv(
    col_types = coltypes,
    na = "",
    n_max = 64783 # omit last line, which contains version metadata
  )

dplyr::glimpse(immigrants_orig)

# not really needed, but keeping during development process for easy retrieval
saveRDS(immigrants_orig, here::here("data-raw", "immigrants_orig.Rds"))

rm(coltypes)

usethis::use_data(immigrants_orig, overwrite = TRUE, compress = "bzip2")
