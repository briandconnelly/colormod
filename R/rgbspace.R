#' @title View and adjust the RGB components of a color
#' @name rgbspace
#'
#' @description These functions allow the RGB components of a color---red,
#' green, blue, and alpha---to be seen and manipulated.
#' 
#' TODO: describe these values and their ranges
#'
#' @inheritParams col2hsv
#' @param Ramount Amount to adjust the red component by (default: \code{0})
#' @param Gamount Amount to adjust the green component by (default: \code{0})
#' @param Bamount Amount to adjust the blue component by (default: \code{0})
#' @param amount Amount to adjust the component by (default: \code{0})
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @rdname rgbspace
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' # Get a color's blueness
#' blue("mediumpurple2")
#'
#' # Increase all three components
#' adjust_rgb('#000000', Ramount = 0.1, Gamount = 0.3, Bamount = 0.1)
#' 
#' # Increase redness by 10%
#' adjust_red('#00FFFF', amount = 0.1)
#'

#' @description \code{red} returns a color's red value [0,1]
#' @rdname rgbspace
#' @export
red <- function(col) as.numeric(col2rgb(col)["red",])

#' @description \code{green} returns a color's green value [0,1]
#' @rdname rgbspace
#' @export
green <- function(col) as.numeric(col2rgb(col)["green",])

#' @description \code{blue} returns a color's blue value [0,1]
#' @rdname rgbspace
#' @export
blue <- function(col) as.numeric(col2rgb(col)["blue",])

#' @description \code{alpha} returns a color's alpha channel value [0,1]
#' @rdname rgbspace
#' @export
alpha <- function(col) as.numeric(col2rgb(col, alpha = TRUE)["alpha",])


#' @description \code{adjust_rgb} Increases or decreases each component
#' @rdname rgbspace
#' @export
adjust_rgb <- function(col, Ramount = 0, Gamount = 0, Bamount = 0) {
    #TODO implement
    # TODO: validate Ramount, Gamount, Bamount
    stop("This function isn't implemented!")
}


#' @description \code{adjust_red} Increases or decreases the red component of
#' a color
#' @rdname rgbspace
#' @export
adjust_red <- function(col, amount) adjust_rgb(col = col,
                                               Ramount = amount,
                                               Gamount = 0,
                                               Bamount = 0)


#' @description \code{adjust_green} Increases or decreases the green component
#' of a color
#' @rdname rgbspace
#' @export
adjust_green <- function(col, amount) adjust_rgb(col = col,
                                                 Ramount = 0,
                                                 Gamount = amount,
                                                 Bamount = 0)


#' @description \code{adjust_blue} Increases or decreases the blue component
#' of a color
#' @rdname rgbspace
#' @export
adjust_blue <- function(col, amount) adjust_rgb(col = col,
                                                Ramount = 0,
                                                Gamount = 0,
                                                Bamount = amount)
