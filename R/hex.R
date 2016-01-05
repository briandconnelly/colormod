#' Get a hex string representation of colors
#'
#' @param color One or more colors, either hex or named
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @export
#'
#' @examples
#' hex("orange")
#'
hex <- function(color) rgb2hex(col2rgb(color))
