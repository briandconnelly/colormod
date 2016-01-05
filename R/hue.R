#' @title View or adjust a color's hue
#'
#' @param color One or more colors, either hex or named
#' @param amount Amount to adjust hue by [0,1]
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname hue
#' @importFrom assertthat assert_that


#' @description \code{hue} returns the color's hue [0,360)
#' @rdname hue
#' @export
#' @examples
#' hue("orange")
#'
hue <- function(color) as.numeric(rgb2hsv(col2rgb(color))["h",])
# TODO Should hue be 0..360 or 0..1?


#' @description \code{adjust_hue} Increases or decreases the color's hue
#' @rdname hue
#' @export
adjust_hue <- function(color, amount) adjust_hsv(color = color,
                                                 Hamount = amount)


#' @description \code{complement} returns a color's complement, which is the hue
#' adjusted by 180 degrees
#' @rdname hue
#' @export
#' @examples
#' complement("orange")
#'
complement <- function(color) {
    x <- col2hsv(color)
    x["h",] <- (x["h",] + 0.5) %% 1
    hsv2col(x)
}
