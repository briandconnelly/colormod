#' View a color's RGB components
#' 
#' \code{red}, \code{green}, \code{blue}, and \code{alpha} return the values for
#' those components in RGBA space.
#'
#' @param col Vector containing any of the three kinds of \R color
#' specifications: \enumerate{
#'     \item a color name (see {\link[grDevices]{colors}})
#'     \item a hexadecimal string of the form "\code{#rrggbb}" or
#'     "\code{#rrggbbaa}"(see \code{\link[grDevices]{rgb}})
#'     \item a positive integer \code{i} meaning \code{\link[grDevices]{palette}()[i]}
#' }
#' @return A number indicating the component value [0,1]
#' 
#' @seealso \code{\link{adjust_rgb}} to manipulate these components
#' @rdname rgb_properties


#' @rdname rgb_properties
#' @export
red <- function(col) as.numeric(col2rgb(col)["red",]) / 255


#' @rdname rgb_properties
#' @export
green <- function(col) as.numeric(col2rgb(col)["green",]) / 255


#' @rdname rgb_properties
#' @export
#' @examples
#' # Get a color's blue-ness
#' blue("mediumpurple2")
blue <- function(col) as.numeric(col2rgb(col)["blue",]) / 255


#' @rdname rgb_properties
#' @export
alpha <- function(col) as.numeric(col2rgb(col, alpha = TRUE)["alpha",]) / 255
