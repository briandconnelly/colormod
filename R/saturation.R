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

