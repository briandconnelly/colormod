#' @title View or adjust a color's hue
#'
#' @param color One or more colors, either hex or named
#' @param space The colorspace to use, "\code{HSV}" (default) or "\code{HSL}"
#' @param wrap Whether or not the resulting hue should be constrained to
#' [0,360] (default: \code{TRUE})
#'
#' @return The adjusted colors as hexadecimal strings
#' @rdname hue
#' @importFrom assertthat assert_that


#' @description \code{hue} returns the color's hue [0,360)
#' @rdname hue
#' @export
#' @examples
#' hue("orange")
#'
hue <- function(color, space = "HSV") {
    assert_that(is.color(color))
    assert_that(is.colorspace(space))
    assert_that(toupper(space) %in% c("HSV", "HSL", "HLS"))

    warning("This function isn't currently implemented")

    if (toupper(space) == "HSV") FALSE
    else if (toupper(space) %in% c("HSL", "HLS")) FALSE
}


#' @description \code{complement} returns a color's complement, which is the hue
#' adjusted by 180 degrees
#' @rdname hue
#' @export
#' @examples
#' complement("orange", space = "HSL")
#'
complement <- function(color, space = "HSV", wrap = TRUE) {
    assert_that(is.color(color))
    assert_that(is.colorspace(space))
    assert_that(toupper(space) %in% c("HSV", "HSL", "HLS"))

    if (toupper(space) == "HSV") adjust_hsv(color = color, Hamount = 180,
                                            wraphue = wrap)
    else if (toupper(space) %in% c("HSL", "HLS")) adjust_hsl(color = color,
                                                             Hamount = 180,
                                                             wraphue = wrap)
}
