#' Adjust a color's saturation
#' 
#' @description \code{adjust_saturation} increases the saturation of a color by
#' the amount given. Resulting saturation is clamped to the range [0,1].
#'
#' @param color The color
#' @param amount A value between -1 and 1.
#'
#' @return The adjusted color as a hexadecimal string
#' @note Adjustments are made in the HSV colorspace
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace hex
#' @importFrom colorspace HSV
#' @export
#'
#' @examples
#' desaturate('mediumpurple3', 0.1)
#' 
adjust_saturation <- function(color, amount) {
    assert_that(is.color(color))
    assert_that(is.numeric(amount), amount >= -1.0, amount <= 1.0)
    
    hsv_vals <- coords(as(colRGB(color), 'HSV'))
    hex(HSV(H = hsv_vals[[1,'H']],
            S = max(0, min(1, hsv_vals[[1,'S']] + amount)),
            V = hsv_vals[[1, 'V']]))
}


#' @description \code{saturate} increases the saturation of the color by the
#' given amount
#' @rdname adjust_saturation
#' @export
saturate <- function(color, amount) adjust_saturation(color = color,
                                                      amount = amount)


#' @description \code{desaturate} decreases the saturation of the color by the
#' given amount
#' @rdname adjust_saturation
#' @export
desaturate <- function(color, amount) adjust_saturation(color = color,
                                                        amount = -1 * amount)

#' @description \code{greyscale} fully desaturates the color
#' @rdname adjust_saturation
#' @aliases grayscale
#' @export
greyscale <- function(color) adjust_saturation(color = color, amount = -1)

#' @export
grayscale <- greyscale
