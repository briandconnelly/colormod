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


#' @description \code{adjust_brightness} Increases or decreases the color's
#' brightness in HSV space
#' @rdname brightness
#' @export
adjust_brightness <- function(col, amount) adjust_hsv(col = col,
                                                      Vamount = amount)


#' @description \code{lighten} increases the brightness of the color by the
#' given amount in HSV space
#' @rdname brightness
#' @export
lighten <- function(col, amount) adjust_hsv(col = col, Vamount = amount)


#' @description \code{darken} decreases the brightness of the color by the
#' given amount in HSV space
#' @rdname brightness
#' @export
darken <- function(col, amount) adjust_hsv(col = color, Vamount = -1 * amount)
