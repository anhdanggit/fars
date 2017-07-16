#' @name make_filename
#' @title make_filename
#'
#' @description Function \code{make_filename} takes an \code{year} and create a filename
#' in the format of \code{"accident_year.csv.bz2"}.
#'
#' @param year a year corresponding to the data
#'
#' @return Function \code{make_filename} returns a character vector containing the value of \code{year}
#' in the format of \code{filename}.
#'
#' @note If \code{year} is not integer, it would be transfered to \code{\link{as.integer}}.
#'
#' @examples
#' make_filename(2016)
#' make_filename(2017)
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
