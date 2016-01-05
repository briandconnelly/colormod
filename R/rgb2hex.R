# TODO: document
# TODO: alpha support
#' @title RGB to Hex Color Conversion
#' 
#' @description TODO
#'
#' @param color TODO
#' @param alpha TODO
#'
#' @return TODO
#' @export
#'
#' @examples
#' TODO
#'
rgb2hex <- function(color, alpha = FALSE) {
    apply(color, 2, function (x) {
        sprintf("#%02X%02X%02X", x["red"], x["green"], x["blue"])
    })
}
