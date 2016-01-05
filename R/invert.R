#' Invert a color
#'
#' \code{invert} inverts each channel of a color in RGB space
#'
#' @inheritParams col2hsv
#'
#' @return The inverted color as a hexadecimal string
#' @export
#'
#' @examples
#' invert('#FF00FF')
#'
invert <- function(col) rgb2hex(255 - col2rgb(col))
