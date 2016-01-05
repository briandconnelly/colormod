#' Invert a color
#'
#' \code{invert} inverts each channel of a color
#'
#' @param color The color to invert
#'
#' @return The inverted color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' invert('#FF00FF')
#'
invert <- function(color) rgb2hex(255 - col2rgb(mycolor))
