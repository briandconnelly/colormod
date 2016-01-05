# TODO document
#' @title HSV to RGB conversion
#' 
#' @description TODO
#' 
#' \code{hsv2rgb} transforms colors from HSV space into RGB space
#'
#' @param color TODO copy from col2rgb
#'
#' @return An integer matrix with three or four (for \code{alpha = TRUE}) rows
#' and number of columns the length of col. If col has names these are used as
#' the column names of the return value.
#' @export
#'
#' @examples
#' TODO
#'
hsv2rgb <- function(color, alpha = FALSE) {
    col2rgb(col = hsv2col(color), alpha = alpha)
}
