#' @title Color to HSV Conversion
#'
#' @description Convert \R colors to HSV (hue/saturation/value)
#'
#' @param col Vector containing any of the three kinds of \R color
#' specifications: \enumerate{
#'     \item a color name (see {\link[grDevices]{colors}})
#'     \item a hexadecimal string of the form "\code{#rrggbb}" (see
#'     \code{\link[grDevices]{rgb}})
#'     \item a positive integer \code{i} meaning \code{\link[grDevices]{palette}()[i]}
#' }
#' @note The alpha channel is stripped from hexadecimal strings where one is
#' included
#' @return A matrix with a column for each color. The three rows of the matrix
#' indicate hue ("\code{h}"), saturation ("\code{s}"), and value ("\code{v}"),
#' which is also referred to as \emph{brightness}).
#' @export
#'
#' @examples
#' col2hsv("red")
#' col2hsv(c("#FF0000", "mediumpurple3", 2, "steelblue4"))
#'
col2hsv <- function(col) {
    rgb2hsv(col2rgb(col))
}
