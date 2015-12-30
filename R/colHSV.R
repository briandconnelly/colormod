#' Convert a hex or named color to a colorspace HSV object
#'
#' @param color The color
#'
#' @return An object of class RGB.
#' @note Alpha values are ignored
#' @seealso \code{\link{HSV}}
#' @importFrom assertthat assert_that
#' @importFrom colorspace HSV
#' @importFrom colorspace RGB
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' colHSV("orange")
#'
colHSV <- function(color) {
    assert_that(is.color(color))
    x <- col2rgb(color) / 255
    as(RGB(R = x[['red', 1]], G = x[['green', 1]], B = x[['blue', 1]]), 'HSV')
}
