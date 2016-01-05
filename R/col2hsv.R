# TODO: document
#' @title Color to HSV Conversion
#' 
#' @description TODO
#'
#' @param color vector of any of the three kinds of R color specifications TODO (see col2rgb)
#'
#' @return A matrix with a column for each color. The three rows of the matrix
#' indicate hue, saturation and value and are named "\code{h}", "\code{s}", and
#' "\code{v}" accordingly.
#' @export
#'
#' @examples
#' TODO
#'
col2hsv <- function(color) {
    rgb2hsv(col2rgb(color))
}
