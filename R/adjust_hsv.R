#' @title Adjust color properties in HSV space
#' 
#' @description \code{adjust_hsv} adjusts the properties of colors in HSV space (hue, saturation, and value/brightness)
#'
#' @param color One or more colors, either hex or named
#' @param Hamount Amount to adjust hue (default: 0)
#' @param Samount Amount to adjust saturation (default: 0)
#' @param Vamount Amount to adjust value/brightness (default: 0)
#' @param amount Amount to adjust the component by (default: 0)
#' @param wraphue Whether or not the resulting hue should be constrained to
#' [0,360) (default: TRUE)
#'
#' @return The adjusted colors as hexadecimal strings
#' @note Adjusted saturation and brightness are clamped to the range [0,1].
#' @note If \code{wraphue} is \code{FALSE}, resulting hue is clamped to the
#' range [0,360].
#' @importFrom assertthat assert_that
#' @importFrom assertthat are_equal
#' @importFrom colorspace coords
#' @importFrom colorspace HSV
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsv(color = "orange", Samount = -0.1)
#' 
#' lighten('orange', 0.2)
#' 
adjust_hsv <- function(color, Hamount = 0, Samount = 0, Vamount = 0,
                       wraphue = TRUE) {
    assert_that(is.color(color))
    assert_that(is.numeric(Hamount), is.numeric(Samount), is.numeric(Vamount))

    if (length(Hamount) > 1) assert_that(are_equal(length(color),
                                                   length(Hamount)))
    if (length(Samount) > 1) assert_that(are_equal(length(color),
                                                   length(Samount)))
    if (length(Vamount) > 1) assert_that(are_equal(length(color),
                                                   length(Vamount)))
    
    adjustments <- data.frame(color = color, Hamount = Hamount,
                              Samount = Samount, Vamount = Vamount)
    
    apply(adjustments, 1, function(x) {
        Hamnt <- as.numeric(x[['Hamount']])
        Samnt <- as.numeric(x[['Samount']])
        Vamnt <- as.numeric(x[['Vamount']])
        
        ccoords <- coords(colHSV(x[['color']])[[1]])
        
        if (wraphue) newH <- ccoords[[1,"H"]] + Hamnt %% 360
        else newH <- max(0, min(360, ccoords[[1,"H"]] + Hamnt))
        
        colorspace::hex(HSV(H = newH,
                            S = max(0, min(1, ccoords[[1,"S"]] + Samnt)),
                            V = max(0, min(1, ccoords[[1,"V"]] + Vamnt))))
    })
}


# Working with Hue --------------------------------------------------------

#' @description \code{complement_HSV} returns the complement of the color by
#' adjusting the color's hue by 180 degrees
#' @rdname adjust_hsv
#' @export
complement_HSV <- function(color, wrap = TRUE) adjust_hsv(color = color,
                                                          Hamount = 180,
                                                          wraphue = wrap)


# Working with Saturation -------------------------------------------------

#' @description \code{saturate_HSV} increases saturation by the given amount
#' @rdname adjust_hsv
#' @export
saturate_HSV <- function(color, amount) adjust_hsv(color = color,
                                                   Samount = amount)


#' @description \code{desaturate_HSV} decreases saturation by the given amount
#' @rdname adjust_hsv
#' @export
desaturate_HSV <- function(color, amount) adjust_hsv(color = color,
                                                     Samount = -1 * amount)


#' @description \code{greyscale_HSV} fully desaturates the color
#' @rdname adjust_hsv
#' @aliases grayscale
#' @export
greyscale_HSV <- function(color, space) adjust_hsv(color = color, Samount = -1)

#' @export
grayscale_HSV <- greyscale_HSV


# Working with Brightness -------------------------------------------------

#' @description \code{lighten} increases the brightness of the color by the
#' given amount
#' @rdname adjust_hsv
#' @export
lighten <- function(color, amount) adjust_hsv(color = color, Vamount = amount)


#' @description \code{darken} decreases the brightness of the color by the
#' given amount
#' @rdname adjust_hsv
#' @export
darken <- function(color, amount) adjust_hsv(color = color,
                                             Vamount = -1 * amount)

