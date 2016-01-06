#' @title View or adjust a color's hue
#'
#' @inheritParams col2hsv
#' @param amount Amount to adjust hue by [0,1]
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname hue


#' @description \code{hue} returns the color's hue [0,1]
#' @rdname hue
#' @export
#' @examples
#' hue("orange")
#'
hue <- function(col) as.numeric(rgb2hsv(col2rgb(col))["h",])
# TODO Should hue be 0..360 or 0..1?
