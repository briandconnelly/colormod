#' @title View a color's properties
#' @rdname properties
#' @description \code{saturation} returns a color's saturation [0,1]
#'
#' @param color The color
#' @param space The colorspace, HSV (default), HSL, or HLS
#' @return The color's property value
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @export
#'
#' @examples
#' saturation('orange')
#' 
saturation <- function(color, space = "HSV") {
    assert_that(is.color(color))
    assert_that(space %in% c("HSV", "HSL", "HLS"))
    if (space == "HSL" | space == "HLS") ccoords <- coords(colHLS(color))
    else ccoords <- coords(colHSV(color))
    ccoords[[1, "S"]]
}


#' @description \code{hue} returns a color's hue [0,360)
#' @rdname properties
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @export
hue <- function(color, space = "HSV") {
    assert_that(is.color(color))
    assert_that(space %in% c("HSV", "HSL", "HLS"))
    if (space == "HSL" | space == "HLS") ccoords <- coords(colHLS(color))
    else ccoords <- coords(colHSV(color))
    ccoords[[1, "H"]]
}


#' @description \code{brightness} returns a color's brightness (value) in HSV space [0,1]
#' @rdname properties
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace HSV
#' @export
brightness <- function(color) {
    assert_that(is.color(color))
    ccoords <- coords(colHSV(color))
    ccoords[[1, "V"]]
}


#' @description \code{lightness} returns a color's brightness (value) in HSL space [0,1]
#' @rdname properties
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace HLS
#' @export
lightness <- function(color) {
    assert_that(is.color(color))
    hls_vals <- coords(colHLS(color))
    hls_vals[[1, "L"]]
}

#' @description \code{red} returns a color's red level [0,1]
#' @rdname properties
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @export
red <- function(color) {
    assert_that(is.color(color))
    rgb_vals <- coords(colRGB(color))
    rgb_vals[[1, "R"]]
}


#' @description \code{green} returns a color's green level [0,1]
#' @rdname properties
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @export
green <- function(color) {
    assert_that(is.color(color))
    rgb_vals <- coords(colRGB(color))
    rgb_vals[[1, "G"]]
}


#' @description \code{red} returns a color's blue level [0,1]
#' @rdname properties
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @export
blue <- function(color) {
    assert_that(is.color(color))
    rgb_vals <- coords(colRGB(color))
    rgb_vals[[1, "B"]]
}
