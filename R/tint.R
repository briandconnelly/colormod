#' Tint a given color, mixing it with white
#'
#' @param color The color to tint
#' @param amount The amount of white to add.
#'
#' @return The tinted color as a hexadecimal string
#' @seealso mix
#' @export
#'
#' @examples
#' tint('#FF0000', 0.2)
#'
tint <- function(color, amount) mix(color1 = color, color2 = '#FFFFFF',
                                    weight = amount)
