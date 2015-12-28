#' Shade a given color, mixing it with black
#'
#' @param color The color to shade
#' @param amount The amount of black to add.
#'
#' @return The shaded color as a hexadecimal string
#' @seealso mix
#' @export
#'
#' @examples
#' \dontrun{
#' shade('#FF0000', 0.2)
#' }
#'
shade <- function(color, amount) mix(color1 = color, color2 = '#000000',
                                     weight = amount)
