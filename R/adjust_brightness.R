#' @title Adjust the brightness of a color
#'
#' @description \code{adjust_brightness} increases the brightness of a color by
#' the amount given. Resulting brightness is clamped to the range [0,1].
#'
#' @param color The color
#' @param amount A value between -1 and 1.
#'
#' @return The adjusted color as a hexadecimal string
#' @note Adjustments are made in the HSV colorspace
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' lighten('orange', 0.2)
#' 
adjust_brightness <- function(color, amount) {
    assert_that(is.color(color))
    assert_that(is.numeric(amount), amount >= -1.0, amount <= 1.0)
    
    ccoords <- coords(colHSV(color))
    hex(HSV(H = ccoords[[1,'H']], S = ccoords[[1,'S']],
            V = max(0, min(1, ccoords[[1,'V']] + amount))))
}

#' @description \code{lighten} increases the brightness of the color by the
#' given amount
#' @rdname adjust_brightness
#' @export
lighten <- function(color, amount) adjust_brightness(color = color,
                                                     amount = amount)


#' @description \code{darken} decreases the brightness of the color by the
#' given amount
#' @rdname adjust_brightness
#' @export
darken <- function(color, amount) adjust_brightness(color = color,
                                                    amount = -1 * amount)
