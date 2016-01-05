# TODO: document (how to write the fancy R?)
#' @title HSV to R color conversion
#' 
#' @description \code{hsv2col} transforms colors from HSV space into   TODO
#'
#' @param color TODO
#'
#' @return A vector of colors corresponding to the given values in HSV space.
#' @export
#'
#' @examples
#' TODO
#'
hsv2col <- function(color) {
    apply(color, 2, function(x) {
        hsv(h = x["h"], s = x["s"], v = x["v"])
    })
}
