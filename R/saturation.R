#' @title View or adjust a color's saturation
#'
#' @param color One or more colors, either hex or named
#' @param amount Amount to adjust saturation by [0,1]
#' @param space The colorspace to use, "\code{HSV}" (default) or "\code{HSL}"
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname saturation
#' @importFrom assertthat assert_that
#'
#' @examples
#' saturate("orange", 0.1)
#'

#' @description \code{saturation} returns the color's saturation [0,1]
#' @rdname saturation
#' @export
saturation <- function(color, space = "HSV") {
    assert_that(is.color(color))
    assert_that(toupper(space) %in% c("HSV", "HSL", "HLS"))
    if(toupper(space) == "HSL") space = "HLS"
    as.numeric(coordinates(color = color, space = toupper(space))@coords[,"S"])
}


#' @description \code{saturate} increases saturation by the given amount
#' @rdname saturation
#' @export
saturate <- function(color, amount, space = "HSV") {
    assert_that(is.color(color))
    assert_that(toupper(space) %in% c("HSV", "HSL", "HLS"))
    if(toupper(space) == "HSL") space = "HLS"

    if (toupper(space) == "HSV") {
        adjust_hsv(color = color, Samount = amount)
    }
    else if (toupper(space) %in% c("HSL", "HLS")) {
        adjust_hsl(color = color, Samount = amount)
    }
}


#' @description \code{desaturate} decreases saturation by the given amount
#' @rdname saturation
#' @export
desaturate <- function(color, amount, space = "HSV") {
    saturate(color = color, amount = -1 * amount, space = space)
}


#' @description \code{greyscale} fully desaturates the color
#' @rdname saturation
#' @aliases grayscale
#' @export
greyscale <- function(color, space = "HSV") {
    saturate(color = color, amount = -1, space = space)
}

#' @export
grayscale <- greyscale
