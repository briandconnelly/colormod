#' @title RGB to Hex Color Conversion
#'
#' @description Convert matrices containing red, green, blue, and alpha
#' (optional) values into hex color strings.
#'
#' @param col An integer matrix with three ("red", "green", and "blue") or four
#' ("alpha") rows and one column for each color in \code{col}. Values are in
#' [0,M], where M is \code{maxColorValue}.
#' @param maxColorValue number giving the maximum value for each of the color
#' components in \code{col} (default: \code{255})
#'
#' @return The colors as hexadecimal strings
#' @seealso \code{\link[grDevices]{col2rgb}} for translating \R colors to RGB
#' vectors
#' @export
#'
#' @examples
#' # Get the hex color code for "orange"
#' rgb2hex(col2rgb("orange"))
#'
rgb2hex <- function(col, maxColorValue = 255) {
    assertthat::assert_that(maxColorValue > 0)

    if (maxColorValue != 255) {
        stop("Sorry, maxColorValue != 255 is not yet supported.")
    }

    # TODO: use maxColorValue
    if ("alpha" %in% row.names(col)) {
        apply(col, 2, function (x) {
            sprintf("#%02X%02X%02X%02X", x["red"], x["green"], x["blue"],
                    x["alpha"])
        })
    }
    else {
        apply(col, 2, function (x) {
            sprintf("#%02X%02X%02X", x["red"], x["green"], x["blue"])
        })
    }
}
