#' Adjust the sRGB components of a color. The resulting components are clamped
#' to the range [0,1].
#'
#' @param color The color
#' @param Ramount Amount to adjust the red component by ([0,1], default: 0)
#' @param Gamount Amount to adjust the green component by ([0,1], default: 0)
#' @param Bamount Amount to adjust the blue component by ([0,1], default: 0)
#' @param amount Amount to adjust the component by (default: 0)
#'
#' @return The adjusted color(s) as a hexadecimal string
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' adjust_rgb('#000000', Ramount = 0.1, Gamount = 0.3, Bamount = 0.1)
#' adjust_red('#00FFFF', amount = 0.1)
#'
adjust_rgb <- function(color, Ramount = 0, Gamount = 0, Bamount = 0) {
    #TODO
    stop("This function isn't implemented!")
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
