# TODO: document (how to write the fancy R?)
#' @title HSV to R color conversion
#'
#' @description \code{hsv2col} transforms colors from HSV space into   TODO
#'
#' @inheritParams col2hsv
#'
#' @return A vector of colors (as hexadecimal strings) corresponding to the
#' given values in HSV space
#' @export
#'
#' @examples
#' TODO
#'
hsv2col <- function(col) {
    apply(col, 2, function(x) {
        hsv(h = x["h"], s = x["s"], v = x["v"])
    })
}
