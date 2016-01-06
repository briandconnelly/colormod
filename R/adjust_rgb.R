#' Adjust a color's RGB components
#' 
#' @description These functions adjust a color's red, green, and blue components
#' 
#' @description \code{adjust_rgb} adjusts red, green, and blue, either
#' by replacing the current value (\code{mode="absolute"}) or adding to it
#' (\code{mode="relative"}, the default).
#'
#' @inheritParams col2hsv
#' @param r The adjustment in hue [-1,1] (default: \code{NULL})
#' @param g The adjustment in saturation [-1,1] (default: \code{NULL})
#' @param b The adjustment in brightness [-1,1] (default: \code{NULL})
#' @param mode Whether the adjustments set the value directly
#' ("\code{absolute}") or are added to the current value ("\code{relative}",
#' default).
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @seealso \code{\link{red}}, \code{\link{green}}, \code{\link{blue}}, and
#' \code{\link{alpha}} to get RGB component values
#' 
#' @export
#'
#' @examples
#' # Add red to purple
#' adjust_rgb("purple", r = 0.2)
#'
adjust_rgb <- function(col, r = NULL, g = NULL, b = NULL, mode = "relative") {
    if (!is.null(r)) assertthat::assert_that(is.numeric(r), r >= -1, r <= 1)
    if (!is.null(g)) assertthat::assert_that(is.numeric(g), g >= -1, g <= 1)
    if (!is.null(b)) assertthat::assert_that(is.numeric(b), b >= -1, b <= 1)
    assertthat::assert_that(tolower(mode) %in% c("relative", "absolute"))

    x <- col2rgb(col = col)

    if (tolower(mode) == "relative") {
        if (!is.null(r)) x["red",] <- clamp(x["red",] + round(r * 255),
                                            0, 255)
        if (!is.null(g)) x["green",] <- clamp(x["green",] + round(g * 255),
                                              0, 255)
        if (!is.null(b)) x["blue",] <- clamp(x["blue",] + round(b * 255),
                                             0, 255)

        rgb2hex(x)
    }
    else if (tolower(mode) == "absolute") {
        if (!is.null(r)) x["red",] <- clamp(round(r * 255), 0, 255)
        if (!is.null(g)) x["green",] <- clamp(round(g * 255), 0, 255)
        if (!is.null(b)) x["blue",] <- clamp(round(b * 255), 0, 255)
        rgb2hex(x)
    }
}
