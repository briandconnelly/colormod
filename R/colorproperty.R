#' Get values of color properties in different color spaces
#'
#' @param color One or more colors, either hex or named
#' @param space The color space
#' @param property The property value to get. For example, when \code{space} is
#' \code{HSV}, \code{property} can be "H", "S", or "V".
#'
#' @return Numeric property values
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' colorproperty(color = "mediumpurple3", space = "HSV", property = "S")
#'
colorproperty <- function(color, space, property) {
    assert_that(is.color(color))
    as.numeric(coordinates(color = color, space = space)@coords[,property])
}


# RGB Properties ----------------------------------------------------------

#' @export
#' @rdname colorproperty
red <- function(color) colorproperty(color = color, space = "RGB",
                                     property = "R")

#' @export
#' @rdname colorproperty
green <- function(color) colorproperty(color = color, space = "RGB",
                                       property = "G")

#' @export
#' @rdname colorproperty
blue <- function(color) colorproperty(color = color, space = "RGB",
                                      property = "B")
