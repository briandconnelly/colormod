#' Get a hex string representation of colors
#'
#' @inheritParams col2hsv
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @export
#'
#' @examples
#' hex("orange")
#'
hex <- function(col) rgb2hex(col2rgb(col))
