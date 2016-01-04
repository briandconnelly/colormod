#' @title Adjust color properties in HSV space
#'
#' @description \code{adjust_hsv} adjusts the properties of colors in HSV space
#' (hue, saturation, and value/brightness)
#'
#' @param color One or more colors, either hex or named
#' @param Hamount Amount to adjust hue (default: 0)
#' @param Samount Amount to adjust saturation (default: 0)
#' @param Vamount Amount to adjust value/brightness (default: 0)
#' @param amount Amount to adjust the component by (default: 0)
#' @param wraphue Whether or not the resulting hue should be constrained to
#' [0,360) (default: TRUE)
#'
#' @return The adjusted colors as hexadecimal strings
#' @note Adjusted saturation and brightness are clamped to the range [0,1].
#' @note If \code{wraphue} is \code{FALSE}, resulting hue is clamped to the
#' range [0,360].
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.flag
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsv(color = "orange", Samount = -0.1)
#'
#' lighten('orange', 0.2)
#'
adjust_hsv <- function(color, Hamount = 0, Samount = 0, Vamount = 0,
                       wraphue = TRUE) {
    assert_that(is.color(color))
    assert_that(is.numeric(Hamount), is.numeric(Samount), is.numeric(Vamount))
    assert_that(is.flag(wraphue))

    coords <- coordinates(color = color, space = "HSV")

    if (wraphue) coords@coords[,"H"] <- (coords@coords[,"H"] + Hamount) %% 360
    else coords@coords[,"H"] <- coords@coords[,"H"] + Hamount

    coords@coords[,"S"] <- clamp(coords@coords[,"S"] + Samount, 0, 1)
    coords@coords[,"V"] <- clamp(coords@coords[,"V"] + Vamount, 0, 1)
    hex(coords)
}


# Working with Brightness -------------------------------------------------

#' @description \code{lighten} increases the brightness of the color by the
#' given amount
#' @rdname adjust_hsv
#' @export
lighten <- function(color, amount) adjust_hsv(color = color, Vamount = amount)


#' @description \code{darken} decreases the brightness of the color by the
#' given amount
#' @rdname adjust_hsv
#' @export
darken <- function(color, amount) adjust_hsv(color = color,
                                             Vamount = -1 * amount)

