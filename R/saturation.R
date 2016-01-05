#' @title View or adjust a color's saturation
#'
#' @inheritParams col2hsv
#' @param amount Amount to adjust saturation by [0,1]
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname saturation
#'
#' @examples
#' saturate("orange", 0.1)
#'

#' @description \code{saturation} returns the color's saturation [0,1]
#' @rdname saturation
#' @export
saturation <- function(col) as.numeric(rgb2hsv(col2rgb(col))["s",])


#' @description \code{saturate} increases saturation by the given amount
#' @rdname saturation
#' @aliases adjust_saturation
#' @export
saturate <- function(col, amount) adjust_hsv(col = col, Samount = amount)

#' @export
adjust_saturation <- saturate


#' @description \code{desaturate} decreases saturation by the given amount
#' @rdname saturation
#' @export
desaturate <- function(col, amount) adjust_hsv(col = col,
                                               Samount = -1 * amount)


#' @description \code{greyscale} fully desaturates the color
#' @rdname saturation
#' @aliases grayscale
#' @export
greyscale <- function(col, amount) adjust_hsv(col = col, Samount = -1)

#' @export
grayscale <- greyscale
