#' @name fars_read
#' @title fars_read
#'
#' @description Functions \code{fars_read} reads a file with \code{filename} in table format
#' to create the data frame.
#'
#' @param filename a character string giving the name of a file in table format
#'
#' @return Function \code{fars_read} returns a data frame, with with cases corresponding to
#' lines and variables to fields in the file.
#'
#' @note If the file with \code{filename} does not exist,
#' the error message would be displayed.
#'
#' @examples
#' far_read("accident_2013.csv.bz2")
#' far_read("accident_2014.csv.bz2")
#'
#' @importFrom readr dplyr
#' @export
fars_read <- function(filename) {
  if(!file.exists(system.file("extdata", filename, package = "fars")))
    stop("file '", system.file("extdata", filename, package = "fars"), "does not exist")
  data <- suppressMessages({
    readr::read_csv(system.file("extdata", filename, package = "fars"), progress = FALSE)
  })
  dplyr::tbl_df(data)
}

