#' Immigrants to England 1330-1550
#'
#' A dataset containing 64,783 names of people known to have migrated to England during the period of the Hundred Years’ War and the Black Death, the Wars of the Roses and the Reformation.
#'
#' England’s Immigrants 1330-1550 is a major research project funded by the Arts and Humanities Research Council, which ran between February 2012 and February 2015 and explored the extensive archival evidence about the names, origins, occupations and households of a significant number of foreigners who chose to make their lives and livelihoods in England in the era of the Hundred Years War, the Black Death and the Wars of the Roses. The project contributes creatively to the longer-term history of immigration to England, and helps to provide a deep historical and cultural context to contemporary debates over ethnicity, multiculturalism and national identity.
#'
#' The information within this database has been drawn from a variety of published and un-published records – taxation assessments, letters of denization and protection, and a variety of other licences and grants – and offers a valuable resource for anyone interested in the origins, destinations, occupations and identities of the people who chose to make England their home during this turbulent period.
#'
#'
#' The project is a collaboration between the University of York, The National Archives and the Humanities Research Institute, University of Sheffield.
#'
#' @format A tibble with 64783 rows and 54 variables:
#' \describe{
#'  \item{idperson}{Unique ID code}
#'  \item{page_number}{}
#'  \item{person_record_content}{Categorical: Blank/Damaged/Illegible/Uncertain/NA}
#'  \item{title}{}
#'  \item{forename}{}
#'  \item{forename_standard}{Standardised spelling}
#'  \item{particle}{}
#'  \item{surname}{}
#'  \item{surname_standard}{}
#'  \item{suffix}{}
#'  \item{origin_nationality}{Verbatim}
#'  \item{origin_nationality_standard}{Standardised}
#'  \item{origin_town}{Verbatim}
#'  \item{origin_town_standard}{Standardised}
#'  \item{origin_region}{Verbatim}
#'  \item{origin_region_standard}{Standardised}
#'  \item{origin_region_modern}{Modern region or nation of origin}
#'  \item{gender}{Categorical: Female/Male}
#'  \item{householder}{Categorical: Yes/NA}
#'  \item{dob}{Date of birth}
#'  \item{dob_type}{Categorical: Exact/Circa/Before}
#'  \item{dod}{Date of death}
#'  \item{dod_type}{Categorical: Exact/Circa/Before}
#'  \item{residence_year}{}
#'  \item{residence_month}{}
#'  \item{wealth_type}{Categorical: Goods/Lands/Poll Tax/Wages/NA}
#'  \item{wealth_total_l}{Pounds}
#'  \item{wealth_total_s}{Shillings}
#'  \item{wealth_total_d}{Pence}
#'  \item{wealth_payable_l}{Payable (tax), pounds}
#'  \item{wealth_payable_s}{Payable (tax), shilling}
#'  \item{wealth_payable_d}{Payable (tax), pence}
#'  \item{residence_county}{}
#'  \item{residence_town}{}
#'  \item{residence_ward}{}
#'  \item{person_notes}{}
#'  \item{biographical_notes}{}
#'  \item{aliases}{}
#'  \item{occupations}{}
#'  \item{social_statuses}{}
#'  \item{document_iddocument}{}
#'  \item{archive}{}
#'  \item{reference}{}
#'  \item{part}{}
#'  \item{document_type}{}
#'  \item{document_start_date}{}
#'  \item{document_start_date_type}{}
#'  \item{document_end_date}{}
#'  \item{document_end_date_type}{}
#'  \item{content_start_date}{}
#'  \item{content_start_date_type}{}
#'  \item{content_end_date}{}
#'  \item{content_end_date_type}{}
#'  \item{document_notes}{}
#' }
#'
#' ^^^ to be continued...
#'
#' This descriptive text is copied from the research project website
#' @source \url{https://www.englandsimmigrants.com/}
#'
#' See also README.md
"immigrants_orig"
