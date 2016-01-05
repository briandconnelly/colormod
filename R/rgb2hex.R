# TODO: document
# TODO: alpha support
#' @title RGB to Hex Color Conversion
#'
#' @description TODO
#'
#' @inheritParams col2hsv
#' @param alpha TODO
#'
#' @return TODO
#' @export
#'
#' @examples
#' TODO
#'
rgb2hex <- function(col, alpha = FALSE) {
    apply(col, 2, function (x) {
        sprintf("#%02X%02X%02X", x["red"], x["green"], x["blue"])
    })
}
