#' Convert a hex or named color to a colorspace RGB object
#'
#' @param color The color
#'
#' @return An object of class RGB.
#' @note Alpha values are ignored
#' @seealso \code{\link[colorspace]{RGB}}
#' @importFrom assertthat assert_that
#' @importFrom colorspace sRGB
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' colRGB("orange")
#'
colRGB <- function(color) {
    assert_that(is.color(color))
    x <- col2rgb(color) / 255
    sRGB(R = x[['red', 1]], G = x[['green', 1]], B = x[['blue', 1]])
}
