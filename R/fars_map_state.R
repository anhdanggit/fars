#' @name fars_map_state
#' @title fars_map_state
#'
#' @description Function \code{fars_map_state} plots the locations of accidents of a state
#' in a specific year by longtitude and latitude.
#'
#' @param state.num an indentified number of state.
#' @param year a year corresponding to the data
#'
#' @return Function \code{fars_map_state} returns a graphic plots the locations of accidents
#' within a state in a year, by \code{LONGITU} and \code{LATITUDE}.
#' @note If \code{state.num} is not integer, it would be transformed to \code{\link{as.integer}}.
#' If \code{state.num} does not exist in the data, it would be reported.
#' If the location of a accident is \code{NA}, it would not be plotted in the map
#' @note If \code{year} is not integer, it would be transfered to \code{\link{as.integer}}.
#'
#' @examples
#' \dontrun{fars_map_state(1,2015)}
#' \dontrun{fars_map_state(2, 2016)}
#'
#' @import tidyr
#' @import maps
#' @import graphics
#' @import dplyr
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
