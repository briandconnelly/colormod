#' Adjust a color's saturation
#' 
#' @description \code{adjust_saturation} increases the saturation of a color by
#' the amount given. Resulting saturation is clamped to the range [0,1].
#'
#' @param color The color
#' @param amount A value between -1 and 1.
#' @param space The colorspace, HSV (default), HSL, or HLS
#'
#' @return The adjusted color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' desaturate('mediumpurple3', 0.1)
#' 
adjust_saturation <- function(color, amount, space = "HSV") {
    assert_that(is.color(color))
    assert_that(is.numeric(amount), amount >= -1.0, amount <= 1.0)
    
    ccoords <- coords(colHSV(color))
    hex(HSV(H = ccoords[[1,'H']],
            S = max(0, min(1, ccoords[[1,'S']] + amount)),
            V = ccoords[[1, 'V']]))
}


#' @description \code{saturate} increases the saturation of the color by the
#' given amount
#' @rdname adjust_saturation
#' @export
saturate <- function(color, amount, space = "HSV") {
    adjust_saturation(color = color, amount = amount, space = space)
}


#' @description \code{desaturate} decreases the saturation of the color by the
#' given amount
#' @rdname adjust_saturation
#' @export
desaturate <- function(color, amount, space = "HSV") {
    adjust_saturation(color = color, amount = -1 * amount, space = space)
}

#' @description \code{greyscale} fully desaturates the color
#' @rdname adjust_saturation
#' @aliases grayscale
#' @export
greyscale <- function(color, space) {
    adjust_saturation(color = color, amount = -1, space = space)
}

#' @export
grayscale <- greyscale
