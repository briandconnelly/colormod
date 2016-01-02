#' Adjust the sRGB components of a color. The resulting components are clamped
#' to the range [0,1].
#'
#' @param color The color
#' @param Ramount Amount to adjust the red component by (default: 0)
#' @param Gamount Amount to adjust the green component by (default: 0)
#' @param Bamount Amount to adjust the blue component by (default: 0)
#' @param amount Amount to adjust the component by (default: 0)
#'
#' @return The adjusted color as a hexadecimal string
#' @importFrom assertthat assert_that
#' @importFrom colorspace coords
#' @importFrom colorspace hex
#' @importFrom colorspace sRGB
#' @export
#'
#' @examples
#' adjust_rgb('#000000', Ramount = 0.1, Gamount = 0.3, Bamount = 0.1)
#' adjust_red('#00FFFF', amount = 0.1)
#' 
adjust_rgb <- function(color, Ramount = 0, Gamount = 0, Bamount = 0) {
    assert_that(is.color(color))
    assert_that(is.numeric(Ramount), Ramount >= 0, Ramount <= 1)
    assert_that(is.numeric(Gamount), Gamount >= 0, Gamount <= 1)
    assert_that(is.numeric(Bamount), Bamount >= 0, Bamount <= 1)

    rgb_vals <- coords(colRGB(color))

    hex(sRGB(R = max(0, min(1, rgb_vals[1,"R"] + Ramount)),
             G = max(0, min(1, rgb_vals[1,"G"] + Gamount)),
             B = max(0, min(1, rgb_vals[1,"B"] + Bamount))))
}


#' @description \code{adjust_red} Increases or decreases the red component of
#' a color
#' @rdname adjust_rgb
#' @export
adjust_red <- function(color, amount) adjust_rgb(color = color,
                                                 Ramount = amount,
                                                 Gamount = 0,
                                                 Bamount = 0)


#' @description \code{adjust_green} Increases or decreases the green component
#' of a color
#' @rdname adjust_rgb
#' @export
adjust_green <- function(color, amount) adjust_rgb(color = color,
                                                  Ramount = 0,
                                                  Gamount = amount,
                                                  Bamount = 0)


#' @description \code{adjust_blue} Increases or decreases the blue component
#' of a color
#' @rdname adjust_rgb
#' @export
adjust_blue <- function(color, amount) adjust_rgb(color = color,
                                                  Ramount = 0,
                                                  Gamount = 0,
                                                  Bamount = amount)
