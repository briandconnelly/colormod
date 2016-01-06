#' @title HSV to RGB conversion
#'
#' @description Convert matrices containing hue, saturation, and brightness
#' values into hex color strings.
#'
#' \code{hsv2rgb} transforms colors from HSV space into RGB space
#'
#' @param col A matrix containing three rows (\code{h}, \code{s}, \code{v}) and
#' a column for each color specified. Values are in [0,1].
#' @param alpha Whether or not the alpha channel (opacity) value should be
#' included. Because HSV matrices do not have this information, full opacity
#' is used.
#'
#' @return An integer matrix with three rows or four rows (\code{red},
#' \code{green}, \code{blue}, \code{alpha}) a column for each color specified in
#' \code{col}. Values are in [0,255].
#' @seealso \code{\link{col2hsv}} for creating HSV value matrices from \R colors
#' and \code{\link[grDevices]{col2rgb}} for converting \R colors to RGB matrices
#' @seealso \code{\link[grDevices]{rgb2hsv}} for converting from RGB to HSV
#' @export
#'
#' @examples
#' # Convert back and forth
#' hsv2rgb(rgb2hsv(255,10,0))
#'
hsv2rgb <- function(col, alpha = FALSE) {
    col2rgb(col = hsv2hex(col), alpha = alpha)
}
