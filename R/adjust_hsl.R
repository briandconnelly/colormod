#' @title Adjust color properties in HSL space
#' 
#' @description \code{adjust_hsl} (also \code{adjust_hls}) adjusts the
#' properties of colors in HSL space(hue, saturation, and lightness)
#'
#' @param color One or more colors, either hex or named
#' @param Hamount Amount to adjust hue (default: 0)
#' @param Samount Amount to adjust saturation (default: 0)
#' @param Lamount Amount to adjust lightness (default: 0)
#' @param amount Amount to adjust the component by (default: 0)
#' @param wraphue Whether or not the resulting hue should be constrained to
#' [0,360) (default: TRUE)
#'
#' @return The adjusted colors as hexadecimal strings
#' @note Adjusted saturation and brightness are clamped to the range [0,1].
#' @note If \code{wraphue} is \code{FALSE}, resulting hue is clamped to the
#' range [0,360].
#' @aliases adjust_hls
#' @importFrom assertthat assert_that
#' @importFrom assertthat are_equal
#' @importFrom colorspace coords
#' @importFrom colorspace HLS
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' # Decrease saturation of orange by 0.1
#' adjust_hsl(color = "orange", Samount = -0.1)
#' 
#' 
adjust_hsl <- function(color, Hamount = 0, Samount = 0, Lamount = 0,
                       wraphue = TRUE) {
    assert_that(is.color(color))
    assert_that(is.numeric(Hamount), is.numeric(Samount), is.numeric(Lamount))

    adjustments <- data.frame(color = color, Hamount = Hamount,
                              Samount = Samount, Lamount = Lamount)
    
    apply(adjustments, 1, function(x) {
        Hamnt <- as.numeric(x[['Hamount']])
        Samnt <- as.numeric(x[['Samount']])
        Lamnt <- as.numeric(x[['Lamount']])
        
        ccoords <- coords(colHSL(x[['color']])[[1]])
        
        if (wraphue) newH <- ccoords[[1,"H"]] + Hamnt %% 360
        else newH <- max(0, min(360, ccoords[[1,"H"]] + Hamnt))
        
        colorspace::hex(HLS(H = newH,
                            L = max(0, min(1, ccoords[[1,"L"]] + Lamnt)),
                            S = max(0, min(1, ccoords[[1,"S"]] + Samnt))))
    })
}

#' @export
adjust_hls <- adjust_hsl




# Working with Lightness --------------------------------------------------

# TODO
