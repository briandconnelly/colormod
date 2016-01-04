#' @title Color mixing
#' @description \code{mix} mixes two colors together
#'
#' @param color1 One or more colors, either hex or named
#' @param color2 One or more colors, either hex or named
#' @param amount The amount of color2 to add. For \code{shade} and \code{tint}, this is the amount of black and white, respectively, to add.
#' @seealso \code{\link[colorspace]{mixcolor}}
#'
#' @return The mixed colors as hexadecimal strings
#' @importFrom assertthat assert_that
#' @importFrom colorspace hex
#' @importFrom colorspace mixcolor
#' @export
#'
#' @examples
#' mix('#FFFFFF', '#0000FF', 0.2)
#'
mix <- function(color1, color2, amount = 0.5) {
    assert_that(is.color(color1), is.color(color2))
    assert_that(is.numeric(amount), amount >= 0, amount <= 1.0)

    colorspace::hex(mixcolor(alpha = amount,
                             color1 = coordinates(color1),
                             color2 = coordinates(color2)))
}


#' @description \code{shade} shades a given color, mixing it with black
#' @rdname mix
#' @export
shade <- function(color, amount) mix(color1 = color, color2 = "#000000",
                                     amount = amount)


#' @description \code{tint} tints a given color, mixing it with white
#' @rdname mix
#' @export
tint <- function(color, amount) mix(color1 = color, color2 = "#FFFFFF",
                                    amount = amount)
