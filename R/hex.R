#' Get a hex string representation of colors
#'
#' @param color One or more colors, either hex or named
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @importFrom assertthat assert_that
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' hex("orange")
#'
hex <- function(color) {
    if (is.character(color)) {
        colorspace::hex(coordinates(color = color, space = "RGB"))
    }
    else if (is(object = color, class2 = "color")) {
        colorspace::hex(color)
    }
    else {
        stop("Unknown color type")
    }
}
