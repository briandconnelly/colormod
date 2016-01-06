# TODO: alpha support
# TODO: rgb() uses red, green, blue instead of r,g,b
#' Adjust a color's RGB components
#' 
#' @description These functions adjust a color's red, green, blue, and alpha
#' components
#' 
#' @description \code{adjust_rgb} adjusts red, green, blue, and alpha either
#' by replacing the current value (\code{mode="absolute"}) or adding to it
#' (\code{mode="relative"}, the default).
#'
#' @inheritParams col2hsv
#' @param r The adjustment in hue [-1,1]
#' @param g The adjustment in saturation [-1,1]
#' @param b The adjustment in brightness [-1,1]
#' @param a The adjustment in alpha [-1,1]
#' @param mode Whether the adjustments set the value directly
#' ("\code{absolute}") or are added to the current value ("\code{relative}",
#' default).
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @seealso \code{\link{red}}, \code{\link{green}}, \code{\link{blue}}, and
#' \code{\link{alpha}} to these component values
#' 
#' @export
#'
#' @examples
#' # TODO
#'
adjust_rgb <- function(col, r, g, b, a, mode = "relative") {
    assertthat::assert_that(is.numeric(r), r >= -1, r <= 1)
    assertthat::assert_that(is.numeric(g), g >= -1, g <= 1)
    assertthat::assert_that(is.numeric(b), b >= -1, b <= 1)
    assertthat::assert_that(is.numeric(a), a >= -1, a <= 1)
    assertthat::assert_that(tolower(mode) %in% c("relative", "absolute"))
    
    # TODO: implement
}
