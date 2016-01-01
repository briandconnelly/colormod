#' Adjust a color's hue
#' 
#' @description \code{adjust_hue} adjusts a color's hue by a given amount in HSV
#' space. The \code{wrap} parameter, enabled by default, allows the hue value to
#' "wrap around", keeping hue within the range [0,360).
#'
#' @param color The color
#' @param amount The amount, in degrees
#' @param wrap Whether or not the resulting hue should be constrained to [0,360)
#' @param space The colorspace, HSV (default), HSL, or HLS
#'
#' @return The adjusted color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' adjust_hue("#807040", amount = 45)
#' complement("#607080")
#' 
adjust_hue <- function(color, amount, wrap = TRUE, space = "HSV") {
    assert_that(is.color(color))

    ccoords <- coords(colHSV(color))
    
    new_h <- ccoords[[1,'H']] + amount
    if (wrap) new_h <- new_h %% 360
    
    hex(HSV(H = new_h, S = ccoords[[1,'S']], V = ccoords[[1, 'V']]))
}

#' @description \code{complement} returns the complement of the color by
#' adjusting the color's hue by 180 degrees in HSV space
#' @rdname adjust_hue
#' @export
complement <- function(color, wrap = TRUE, space = "HSV") {
    adjust_hue(color = color, amount = 180, wrap = wrap)
}
