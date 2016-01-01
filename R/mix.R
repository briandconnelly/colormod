#' @title Color mixing
#' @description \code{mix} mixes two colors together
#'
#' @param color1 The first color
#' @param color2 The second color
#' @param amount The amount of color to add.
#' @param weight The percentage of color2 to be included in the result. The mixed color is obtained by combining an amount 1-alpha of color1 with an amount alpha of color2.
#' @seealso mixcolor
#'
#' @return The mixed color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @importFrom colorspace hex
#' @importFrom colorspace hex2RGB
#' @importFrom colorspace mixcolor
#' @export
#'
#' @examples
#' mix('#FFFFFF', '#0000FF', 0.2)
#'
mix <- function(color1, color2, weight = 0.5) {
    assert_that(is.color(color1), is.color(color2))
    assert_that(is.numeric(weight), weight >= 0, weight <= 1.0)

    hex(mixcolor(alpha = weight, color1 = colRGB(color1),
                 color2 = colRGB(color2)))
}


#' @description \code{shade} shades a given color, mixing it with black
#' @rdname mix
#' @export
shade <- function(color, amount) mix(color1 = color, color2 = '#000000',
                                     weight = amount)


#' @description \code{tint} tints a given color, mixing it with white
#' @rdname mix
#' @export
tint <- function(color, amount) mix(color1 = color, color2 = '#FFFFFF',
                                    weight = amount)
