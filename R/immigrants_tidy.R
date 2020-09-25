immigrants_orig <- readRDS(here::here("data-raw", "immigrants_orig.Rds"))

library(dplyr)
library(magrittr)
library(purrr)
library(stringr)
library(tibble)
library(tidyr)

# fix invalid dates
fix_date_cols <- function(df, cols) {
  df %>%
    dplyr::mutate(
      dplyr::across(
        dplyr::all_of(cols),
        ~ lubridate::as_date(
          stringr::str_replace_all(., "-00", "-01")
        )
      )
    )
}

# 20, 22, 46 and 48 had to be imported as character vectors not dates
to_date_cols <- c(20, 22, 46, 48)

immigrants_orig %>%
  fix_date_cols(to_date_cols)

rectangularise <- function(df) {
  df %>%
    purrr::map(unique) %>%
    purrr::map(sort) %>%
    purrr::map(~ `length<-`(., max(lengths(map(df, ~ unique(.)))))) %>%
    dplyr::bind_cols()
}


# helper for r_w_c below
add_counts <- function(df) {
  df %>%
    dplyr::filter(!is.na(value)) %>%
    dplyr::add_count(value, name = "count", sort = TRUE) %>%
    dplyr::distinct()
}

rectangularise_with_counts <- function(df) {
  col_names <- unlist(
    map(colnames(df), ~ c(., paste0("count_", .)))
  )
  out <- df %>%
    purrr::map(~.) %>% # makes a list of all df columns

    # need enframe so add_count can work
    purrr::map(~ tibble::enframe(., name = NULL)) %>%
    purrr::map(~ add_counts(.)) %>%
    purrr::flatten()

  out %>%
    map(~ `length<-`(., max(lengths(out)))) %>%
    bind_cols() %>%
    magrittr::set_colnames(col_names)
}


# helps to get an overview of some of the cols: to see what needs tidying
chars_overview <- immigrants_orig %>%
  # there are a LOT of different surnames
  dplyr::select(where(is.character) & !ends_with(c("notes", "surname"))) %>%
  rectangularise_with_counts()

immigrants_tidy_overview <- immigrants_orig %>%
  fix_date_cols(to_date_cols) %>%
  mutate(across(title, ~ str_to_sentence(.))) %>%
  mutate(across(
    where(is.character),
    ~ str_replace(., "^[^[:alnum:]]+$", NA_character_)
  )) %>%
  dplyr::select(where(is.character) & !ends_with(c("notes", "surname"))) %>%
  rectangularise_with_counts()


# find which columns have double spaces
immigrants_orig %>%
  dplyr::summarise(across(
    everything(),
    ~ sum(str_which(., "\\s{2,}"))
  )) %>%
  tidyr::pivot_longer(everything()) %>%
  dplyr::arrange(desc(value))

immigrants_orig %>%
  add_coun


immigrants_tidy <- immigrants_orig %>%
  fix_date_cols(to_date_cols) %>%
  mutate(across(title, ~ str_to_sentence(.))) %>%
  mutate(across(
    where(is.character),
    ~ str_replace(., "^[^[:alnum:]]+$", NA_character_)
  )) %>%
  mutate(across(
    c(ends_with("notes"), "occupations"),
    ~ str_replace_all(
      .,
      c(
        "\\s{2,}" = " ",
        "to to " = "to "
      )
    )
  ))
