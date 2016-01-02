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
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' invert('#FF00FF')
#'
invert <- function(color, amount = 1) {
    assert_that(is.color(color))
    assert_that(is.numeric(amount), amount >= 0, amount <= 1.0)
    x <- (255 - col2rgb(color)) / 255
    hex(sRGB(R = x[["red", 1]], G = x[["green", 1]], B = x[["blue", 1]]))
}
