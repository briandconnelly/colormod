#' @title HSV to Hex Color Conversion
#'
#' @description Convert matrices containing "hue", "saturation", and "value"
#' values into hex color strings.
#'
#' @param col A matrix containing three rows (\code{h}, \code{s}, \code{v}) and
#' a column for each color specified. Values are in [0,1].
#' @param alpha Whether or not to include alpha channel values in the result.
#' Because HSV matrices do not have this information, full opacity ("FF") is
#' used.
#'
#' @return A vector of colors (as hexadecimal strings) corresponding to the
#' given values in HSV space
#' @export
#'
#' @examples
#' hsv2hex(col2hsv("orange"))
#'
hsv2hex <- function(col, alpha = FALSE) {
    apply(col, 2, function(x) {
        hsv(h = x["h"], s = x["s"], v = x["v"])
    })
}
