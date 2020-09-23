# Just to save time with the data documentation process in R/immigrants_orig.R

# readRDS(here::here("data-raw", "immigrants_orig.Rds")) %>%
immigrants_orig %>%
  names() %>%
  paste0("\\item{", ., "}{}") %>%
  paste0(collapse = "\n#'  ") %>%
  writeClipboard()
