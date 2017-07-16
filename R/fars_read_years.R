#' @name fars_read_years
#' @title fars_read_years
#'
#' @description Function \code{fars_read_years} takes a list of years and return the data
#' of specific years, which only remains the variables of \code{MONTH} and \code{year}.
#'
#' @param years a vector or list of years
#'
#' @return Function \code{fars_read_years} returns a list, with the variables \code{MONTH}
#' and \code{year} for each element in argument \code{years}.
#'
#' @note If a element \code{year} in argument \code{years} is invalid,
#' function \code{fars_read_years} returns \code{NULL}
#' and be reported as error in the invalid \code{year}.
#' If \code{year} is not integer, it would be transfered to \code{\link{as.integer}}.
#'
#' @importFrom readr dplyr magrittr
#'
#' @examples
#' fars_read_years(c(2013,2014))
#' fars_read_years(c(2014,2015))
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
