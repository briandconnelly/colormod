#' Return the complement of the color (adjust hue by 180 degrees)
#'
#' @param color One or more colors, either hex or named
#' @param space The colorspace to use, "\code{HSV}" (default) or "\code{HSL}"
#' @param wrap Whether or not the resulting hue should be constrained to
#' [0,360] (default: \code{TRUE})
#'
#' @return The adjusted colors as hexadecimal strings
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' complement("orange")
#' 
complement <- function(color, space = "HSV", wrap = TRUE) {
    assert_that(is.color(color))
    assert_that(toupper(space) %in% c("HSV", "HSL", "HLS"))
    
    if (toupper(space) == "HSV") adjust_hsv(color = color, Hamount = 180, wraphue = wrap)
    else if (toupper(space) %in% c("HSL", "HLS")) adjust_hsl(color = color,
                                                             Hamount = 180,
                                                             wraphue = wrap)
}
