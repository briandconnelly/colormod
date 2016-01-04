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
#' hue('orange')
#'



# can do: c@coords[,"H"] <- colorproperty(mycolor, 'HSV', 'H') * 0.1

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




