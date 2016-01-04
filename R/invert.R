#' Invert a color
#'
#' \code{invert} inverts each channel of a color
#'
#' @param color The color to invert
#' @param amount (currently inactive) The amount by which to invert (0 = none, 1 = full (default))
#'
#' @return The inverted color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @importFrom colorspace hex
#' @importFrom colorspace sRGB
#' @export
#'
#' @examples
#' invert('#FF00FF')
#'
invert <- function(color, amount = 1) {
    assert_that(is.color(color))
    coords <- coordinates(color = color, space = "sRGB")
    coords@coords[,"R"] <- clamp(1 - coords@coords[,"R"], 0, 1)
    coords@coords[,"G"] <- clamp(1 - coords@coords[,"G"], 0, 1)
    coords@coords[,"B"] <- clamp(1 - coords@coords[,"B"], 0, 1)
    hex(coords)
}
