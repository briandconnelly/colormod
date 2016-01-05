#' Get values of color properties in different color spaces
#'
#' @inheritParams col2hsv
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
red <- function(col) as.numeric(col2rgb(col)["red",])

#' @export
#' @rdname colorproperty
green <- function(col) as.numeric(col2rgb(col)["green",])

#' @export
#' @rdname colorproperty
blue <- function(col) as.numeric(col2rgb(col)["blue",])

#' @export
#' @rdname colorproperty
alpha <- function(col) as.numeric(col2rgb(col, alpha = TRUE)["alpha",])
