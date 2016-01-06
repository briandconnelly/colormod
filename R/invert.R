#' Invert a color
#'
#' \code{invert} inverts each channel of a color in RGB space
#'
#' @inheritParams col2hsv
#'
#' @return The inverted color as a hexadecimal string
#' @note Alpha channel values are be stripped from \code{col}
#' @export
#'
#' @examples
#' invert('#FF00FF')
#'
invert <- function(col) rgb2hex(255 - col2rgb(col))
# TODO: what to do about alpha? Don't want to invert, but probably also don't want to remove it.
