#' @title Adjust color properties in HSV space
#'
#' @description \code{adjust_hsv} adjusts the properties of colors in HSV space
#' (hue, saturation, and value/brightness)
#'
#' @inheritParams col2hsv
#' @param Hamount Amount to adjust hue (default: \code{0})
#' @param Samount Amount to adjust saturation (default: \code{0})
#' @param Vamount Amount to adjust value/brightness (default: \code{0})
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @note Adjusted saturation and brightness are clamped to the range [0,1].
#' @note If \code{wraphue} is \code{FALSE}, resulting hue is clamped to the
#' range [0,360].
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.flag
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsv(color = "orange", Samount = -0.1)
#'
#' lighten('orange', 0.2)
#'
# TODO: hue should wrap around. problem 1 + 0 -> 0, which is ok, but produces different hex values
adjust_hsv <- function(col, Hamount = 0, Samount = 0, Vamount = 0) {
    x <- col2hsv(col)
    # TODO assertions
    x["h",] <- clamp(x["h",] + Hamount, 0, 1)
    #x["h",] <- (x["h",] + 0.5) %% 1
    x["s",] <- clamp(x["s",] + Samount, 0, 1)
    x["v",] <- clamp(x["v",] + Vamount, 0, 1)
    hsv2col(x)
}
