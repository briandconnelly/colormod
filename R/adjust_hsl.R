#' @title Adjust color properties in HSL space
#'
#' @description \code{adjust_hsl} (also \code{adjust_hls}) adjusts the
#' properties of colors in HSL space(hue, saturation, and lightness)
#'
#' @param color One or more colors, either hex or named
#' @param Hamount Amount to adjust hue (default: 0)
#' @param Samount Amount to adjust saturation (default: 0)
#' @param Lamount Amount to adjust lightness (default: 0)
#' @param wraphue Whether or not the resulting hue should be constrained to
#' [0,360) (default: TRUE)
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @note Adjusted saturation and brightness are clamped to the range [0,1].
#' @note If \code{wraphue} is \code{FALSE}, resulting hue is clamped to the
#' range [0,360].
#' @aliases adjust_hls
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.flag
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsl(color = "orange", Samount = -0.1)
#'
#'
adjust_hsl <- function(color, Hamount = 0, Samount = 0, Lamount = 0,
                       wraphue = TRUE) {
    assert_that(is.color(color))
    assert_that(is.numeric(Hamount), is.numeric(Samount), is.numeric(Lamount))
    assert_that(is.flag(wraphue))

    coords <- coordinates(color = color, space = "HLS")

    if (wraphue) coords@coords[,"H"] <- (coords@coords[,"H"] + Hamount) %% 360
    else coords@coords[,"H"] <- coords@coords[,"H"] + Hamount

    coords@coords[,"S"] <- clamp(coords@coords[,"S"] + Samount, 0, 1)
    coords@coords[,"L"] <- clamp(coords@coords[,"L"] + Lamount, 0, 1)
    colorspace::hex(coords)
}

#' @export
adjust_hls <- adjust_hsl
