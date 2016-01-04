#' Get color coordinates in a given color space
#'
#' @param color One or more colors, either hex or named
#' @param space The colorspace to use
#'
#' @return A \code{\link[colorspace]{color-class}} object
#' @importFrom assertthat assert_that
#' @importFrom assertthat are_equal
#' @importFrom colorspace RGB
#' @importFrom colorspace sRGB
#' @importFrom colorspace HSV
#' @importFrom colorspace HLS
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' coordinates(color = "orange")
#'
coordinates <- function(color, space = "sRGB") {
    assert_that(is.color(color))
    # TODO: validate space

    if(toupper(space == "HSL")) space <- "HLS"

    x <- col2rgb(color) / 255
    c <- RGB(R = x["red",], G = x["green",], B = x["blue",])
    as(c, space)
}
