#' @title View or adjust a color's brightness/lightness
#'
#' @param color One or more colors, either hex or named
#' @param amount Amount to adjust brightness or lightness by [0,1]
#' @param space The colorspace to use, "\code{HSV}" (default) or "\code{HSL}"
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
brightness <- function(color) {
    assert_that(is.color(color))
    as.numeric(coordinates(color = color, space = "HSV")@coords[,"V"])
}


#' @description \code{lightness} returns the color's lightness in HSL
#' space [0,1]
#' @rdname brightness
#' @export
lightness <- function(color) {
    assert_that(is.color(color))
    as.numeric(coordinates(color = color, space = "HLS")@coords[,"L"])
}


#' @description \code{adjust_brightness} Increases or decreases the color's
#' brightness in HSV space
#' @rdname brightness
#' @export
adjust_brightness <- function(color, amount) {
    adjust_hsv(color = color, Vamount = amount)
}


#' @description \code{adjust_lightness} Increases or decreases the color's
#' lightness in HSL space
#' @rdname brightness
#' @export
adjust_lightness <- function(color, amount) {
    adjust_hsl(color = color, Lamount = amount)
}


#' @description \code{lighten} increases the brightness of the color by the
#' given amount in HSV space
#' @rdname brightness
#' @export
lighten <- function(color, amount) adjust_hsv(color = color, Vamount = amount)


#' @description \code{darken} decreases the brightness of the color by the
#' given amount in HSV space
#' @rdname brightness
#' @export
darken <- function(color, amount) adjust_hsv(color = color,
                                             Vamount = -1 * amount)
