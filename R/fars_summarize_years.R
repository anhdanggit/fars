#' @name fars_summarize_years
#' @title fars_summarize_years
#'
#' @description Function \code{fars_summarize_years} summarizes
#' the number of fatal accidents in each \code{year} by \code{MONTH}.
#'
#' @param years a vector or list of years
#'
#' @return Function \code{fars_summarize_year} returns a data frame with the total numbers of
#' fatal incidences by \code{month}, in each \code{year}.
#'
#' @note If a element \code{year} in argument \code{years} is invalid,
#' function \code{fars_read_years} returns \code{NULL}
#' and be reported as error in the invalid \code{year}.
#' If \code{year} is not integer, it would be transfered to \code{\link{as.integer}}.
#'
#' @import dplyr
#' @import tidyr
#'
#' @examples
#' \dontrun{fars_summarize_years(2014)}
#' \dontrun{fars_summarize_years(c(2012, 2013))}
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
