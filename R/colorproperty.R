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
#' #TODO


# RGB Properties ----------------------------------------------------------

#' @export
#' @rdname colorproperty
red <- function(color) as.numeric(col2rgb(color)["red",])

#' @export
#' @rdname colorproperty
green <- function(color) as.numeric(col2rgb(color)["green",])

#' @export
#' @rdname colorproperty
blue <- function(color) as.numeric(col2rgb(color)["blue",])

#' @export
#' @rdname colorproperty
alpha <- function(color) as.numeric(col2rgb(color, alpha = TRUE)["alpha",])
