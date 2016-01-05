#' @title HSV to RGB conversion
#'
#' @description TODO
#'
#' \code{hsv2rgb} transforms colors from HSV space into RGB space
#'
#' @inheritParams col2hsv
#'
#' @return An integer matrix with three rows
#' and number of columns the length of col. If col has names these are used as
#' the column names of the return value.
#' @export
#'
#' @examples
#' TODO
#'
hsv2rgb <- function(col) {
    col2rgb(col = hsv2col(col))
}
