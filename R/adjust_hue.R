#' Adjust a color's hue
#' 
#' @description \code{adjust_hue} adjusts a color's hue by a given amount in HSV
#' space. The \code{wrap} parameter, enabled by default, allows the hue value to
#' "wrap around", keeping hue within the range [0,360).
#'
#' @param color The color
#' @param amount The amount, in degrees
#' @param wrap Whether or not the resulting hue should be constrained to [0,360)
#'
#' @return The adjusted color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace hex
#' @importFrom colorspace HSV
#' @export
#'
#' @examples
#' adjust_hue("#807040", amount = 45)
#' complement("#607080")
#' 
adjust_hue <- function(color, amount, wrap = TRUE) {
    assert_that(is.color(color))

    hsv_vals <- coords(as(colRGB(color), 'HSV'))
    
    new_h <- hsv_vals[[1,'H']] + amount
    if (wrap) new_h <- new_h %% 360
    
    hex(HSV(H = new_h, S = hsv_vals[[1,'S']], V = hsv_vals[[1, 'V']]))
}

#' @description \code{complement} returns the complement of the color by
#' adjusting the color's hue by 180 degrees in HSV space
#' @rdname adjust_hue
#' @export
complement <- function(color, wrap = TRUE) adjust_hue(color = color,
                                                      amount = 180,
                                                      wrap = wrap)
