#' Convert a hex or named color to a colorspace HLS object
#'
#' @param color The color
#'
#' @return An object of class RGB.
#' @note Alpha values are ignored
#' @seealso \code{\link[colorspace]{HLS}}
#' @importFrom assertthat assert_that
#' @importFrom colorspace HLS
#' @importFrom colorspace RGB
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' colHLS("orange")
#'
colHLS <- function(color) {
    assert_that(is.color(color))
    x <- col2rgb(color) / 255
    as(RGB(R = x[['red', 1]], G = x[['green', 1]], B = x[['blue', 1]]), 'HLS')
}
