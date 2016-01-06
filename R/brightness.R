#' @title View or adjust a color's brightness/lightness
#'
#' @inheritParams col2hsv
#' @param amount Amount to adjust brightness or lightness by [0,1]
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname brightness
#' @importFrom assertthat assert_that
#'
#' @examples
#' brightness("orange")
#'

#' @description \code{brightness} returns the color's brightness in HSV
#' space [0,1]
#' @rdname brightness
#' @export
brightness <- function(col) as.numeric(rgb2hsv(col2rgb(col))["v",])


