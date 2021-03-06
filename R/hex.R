#' Get a hex string representation of colors
#'
#' @inheritParams red
#' @param alpha Whether or not to include alpha channel values in the result
#' (default: \code{FALSE}).
#'
#' @return The color(s) as hexadecimal strings
#' @export
#'
#' @examples
#' hex("orange", alpha = FALSE)
#'
hex <- function(col, alpha = FALSE) {
    rgb2hex(col = col2rgb(col = col, alpha = alpha))
}
