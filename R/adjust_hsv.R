# TODO: hsv() uses h, s, v, not H, S, V
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
#' @param H The adjustment in hue [-1,1]
#' @param S The adjustment in saturation [-1,1]
#' @param V The adjustment in brightness [-1,1]
#' @param mode Whether the adjustments set the value directly
#' ("\code{absolute}") or are added to the current value ("\code{relative}",
#' default).
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @seealso \code{\link{hue}}, \code{\link{saturation}},
#' \code{\link{brightness}}
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsv(color = "orange", S = -0.1)
#'
adjust_hsv <- function(col, H = 0, S = 0, V = 0, mode = "relative") {
    assert_that(is.numeric(H), H >= -1, H <= 1)
    assert_that(is.numeric(S), S >= -1, S <= 1)
    assert_that(is.numeric(V), V >= -1, V <= 1)
    assert_that(tolower(mode) %in% c("relative", "absolute"))

    x <- col2hsv(col)
    
    if (tolower(mode) == "relative") {
        x["h",] <- clamp(x["h",] + H, 0, 1)
        #x["h",] <- (x["h",] + 0.5) %% 1
        x["s",] <- clamp(x["s",] + S, 0, 1)
        x["v",] <- clamp(x["v",] + V, 0, 1)
        hsv2col(x)
    }
    else if (tolower(mode) == "absolute") {
        x["h",] <- clamp(H, 0, 1)
        #x["h",] <- (x["h",] + 0.5) %% 1
        x["s",] <- clamp(S, 0, 1)
        x["v",] <- clamp(V, 0, 1)
        hsv2col(x)
    }
}


#' @description \code{saturate} and \code{desaturate} increase and decrease
#' saturation by the given amount, respectively
#' @param amount The value of the adjustment  
#' @rdname adjust_hsv
#' @export
saturate <- function(col, amount) {
    adjust_hsv(col = col, S = amount, mode = "relative")
}


#' @rdname adjust_hsv
#' @export
desaturate <- function(col, amount) {
    adjust_hsv(col = col, S = -1 * amount, mode = "relative")
}


#' @description \code{greyscale} (or \code{grayscale}) fully desaturates the
#' color                    
#' @rdname adjust_hsv                                                           
#' @aliases grayscale                                                           
#' @export                                                                      
greyscale <- function(col, amount) {
    adjust_hsv(col = col, S = 0, mode = "absolute")          
}

#' @export                                                                      
grayscale <- greyscale


#' @description \code{brighten} and \code{darken} increase and decrease
#' brightness by the given amount, respectively
#' @rdname adjust_hsv                                                           
#' @export                                                                      
brighten <- function(col, amount) adjust_hsv(col = col, V = amount,
                                             mode = "relative")       

#' @rdname adjust_hsv                                                           
#' @export                                                                      
darken <- function(col, amount) adjust_hsv(col = color, V = -1 * amount,
                                           mode = "relative")
