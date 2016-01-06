#' View a color's HSV components
#' 
#' \code{hue}, \code{saturation}, and \code{brightness} return the values for
#' those components
#'
#' @inheritParams col2hsv 
#' @return A number indicating the component value [0,1]
#' 
#' @seealso \code{\link{adjust_hsv}} to manipulate these components
#' @rdname hsv_properties


#' @rdname hsv_properties
#' @export
hue <- function(col) as.numeric(rgb2hsv(col2rgb(col))["h",])

#' @rdname hsv_properties
#' @export
#' @examples
#' # Get the saturation of purple
#' saturation("purple")
saturation <- function(col) as.numeric(rgb2hsv(col2rgb(col))["s",])

#' @rdname hsv_properties
#' @export
brightness <- function(col) as.numeric(rgb2hsv(col2rgb(col))["v",])
