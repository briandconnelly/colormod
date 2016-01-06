# TODO hue adjustments should wrap
#' Adjust a color's HSV components
#' 
#' @description These functions adjust a color's hue, saturation, and brightness
#' (value).
#' 
#' @description \code{adjust_hsv} adjusts hue, saturation, and brightness either
#' by replacing the current value (\code{mode="absolute"}) or adding to it
#' (\code{mode="relative"}, the default).
#'
#' @inheritParams col2hsv
#' @param h The adjustment in hue [-1,1] (default: no adjustment)
#' @param s The adjustment in saturation [-1,1] (default: no adjustment)
#' @param v The adjustment in brightness [-1,1] (default: no adjustment)
#' @param mode Whether the adjustments set the value directly
#' ("\code{absolute}") or are added to the current value ("\code{relative}",
#' default).
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @seealso \code{\link{hue}}, \code{\link{saturation}},
#' \code{\link{brightness}} to these component values
#' 
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsv(color = "orange", s = -0.1)
#'
adjust_hsv <- function(col, h = NULL, s = NULL, v = NULL, mode = "relative") {
    if (!is.null(h)) assertthat::assert_that(is.numeric(h), h >= -1, h <= 1)
    if (!is.null(s)) assertthat::assert_that(is.numeric(s), s >= -1, s <= 1)
    if (!is.null(v)) assertthat::assert_that(is.numeric(v), v >= -1, v <= 1)
    assertthat::assert_that(tolower(mode) %in% c("relative", "absolute"))

    x <- col2hsv(col)

    if (tolower(mode) == "relative") {
        if (!is.null(h)) x["h",] <- clamp(x["h",] + h, 0, 1)
        #if (!is.null(h)) x["h",] <- (x["h",] + 0.5) %% 1
        if (!is.null(s)) x["s",] <- clamp(x["s",] + s, 0, 1)
        if (!is.null(v)) x["v",] <- clamp(x["v",] + v, 0, 1)
        hsv2hex(x)
    }
    else if (tolower(mode) == "absolute") {
        if (!is.null(h)) x["h",] <- clamp(h, 0, 1)
        #if (!is.null(h)) x["h",] <- (x["h",] + 0.5) %% 1
        if (!is.null(s)) x["s",] <- clamp(s, 0, 1)
        if (!is.null(v)) x["v",] <- clamp(v, 0, 1)
        hsv2hex(x)
    }
}


#' @description \code{saturate} and \code{desaturate} increase and decrease
#' saturation by the given amount, respectively
#' @param amount The value of the adjustment  
#' @rdname adjust_hsv
#' @export
saturate <- function(col, amount) {
    adjust_hsv(col = col, s = amount, mode = "relative")
}


#' @rdname adjust_hsv
#' @export
desaturate <- function(col, amount) {
    adjust_hsv(col = col, s = -1 * amount, mode = "relative")
}


#' @description \code{greyscale} (or \code{grayscale}) fully desaturates the
#' color                    
#' @rdname adjust_hsv                                                           
#' @aliases grayscale                                                           
#' @export                                                                      
greyscale <- function(col, amount) {
    adjust_hsv(col = col, s = 0, mode = "absolute")
}

#' @export                                                                      
grayscale <- greyscale


#' @description \code{brighten} and \code{darken} increase and decrease
#' brightness by the given amount, respectively
#' @rdname adjust_hsv                                                           
#' @export                                                                      
brighten <- function(col, amount) adjust_hsv(col = col, v = amount,
                                             mode = "relative")

#' @rdname adjust_hsv                                                           
#' @export                                                                      
darken <- function(col, amount) adjust_hsv(col = color, v = -1 * amount,
                                           mode = "relative")
