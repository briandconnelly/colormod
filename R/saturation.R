#' @title View or adjust a color's saturation
#'
#' @param color One or more colors, either hex or named
#' @param amount Amount to adjust saturation by [0,1]
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname saturation
#' @importFrom assertthat assert_that
#'
#' @examples
#' saturate("orange", 0.1)
#'

#' @description \code{saturation} returns the color's saturation [0,1]
#' @rdname saturation
#' @export
saturation <- function(color) as.numeric(rgb2hsv(col2rgb(color))["s",])


#' @description \code{saturate} increases saturation by the given amount
#' @rdname saturation
#' @aliases adjust_saturation
#' @export
saturate <- function(color, amount) adjust_hsv(color = color, Samount = amount)

#' @export
adjust_saturation <- saturate


#' @description \code{desaturate} decreases saturation by the given amount
#' @rdname saturation
#' @export
desaturate <- function(color, amount) adjust_hsv(color = color,
                                                 Samount = -1 * amount)


#' @description \code{greyscale} fully desaturates the color
#' @rdname saturation
#' @aliases grayscale
#' @export
greyscale <- function(color, amount) adjust_hsv(color = color, Samount = -1)

#' @export
grayscale <- greyscale
