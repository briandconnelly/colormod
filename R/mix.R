#' Add two colors together
#'
#' @param color1 The first color
#' @param color2 The second color
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

    # TODO: get RGB for color1, color2 - accept named colors
    c1 <- colRGB(color1)
    c2 <- colRGB(color2)
    # - mixcolor doesn't support vectors, so could use lapply or something.
    hex(mixcolor(alpha = weight, color1 = c1, color2 = c2))
}
