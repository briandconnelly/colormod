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
    assert_that(is.colorspace(space))

    if(toupper(space) == "SRGB") space <- "sRGB"
    else if(toupper(space) == "HSL") space <- "HLS"

    x <- col2rgb(color) / 255

    # For some reason, sRGB->HLS doesn't work properly, but RGB -> HLS does.
    if (space == "HLS") c <- RGB(R = x["red",], G = x["green",], B = x["blue",])
    else c <- sRGB(R = x["red",], G = x["green",], B = x["blue",])
    as(c, space)
}
