#' TODO: support maxColorValue
#' TODO: col parameter can allow a #rrggbbaa string
#' View a color's RGB components
#' 
#' \code{red}, \code{green}, \code{blue}, and \code{alpha} return the values for
#' those components in RGBA space
#'
#' @inheritParams col2hsv 
#' @return A number indicating the component value [0,255]
#' 
#' @seealso \code{\link{adjust_rgb}} to manipulate these components
#' @rdname rgb_properties


#' @rdname rgb_properties
#' @export
red <- function(col) as.numeric(col2rgb(col)["red",])


#' @rdname rgb_properties
#' @export
green <- function(col) as.numeric(col2rgb(col)["green",])


#' @rdname rgb_properties
#' @export
#' @examples
#' # Get a color's blue-ness
#' blue("mediumpurple2")
blue <- function(col) as.numeric(col2rgb(col)["blue",])


#' @rdname rgb_properties
#' @export
alpha <- function(col) as.numeric(col2rgb(col, alpha = TRUE)["alpha",])
