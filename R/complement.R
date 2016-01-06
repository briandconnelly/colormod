#' Get a color's complement
#' 
#' \code{complement} returns a color's complement, which is the hue adjusted by
#' 180 degrees
#'
#' @inheritParams col2hsv
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @export
#'
#' @examples
#' # Get orange's complement
#' complement("orange")
#'
complement <- function(col) {
    x <- col2hsv(col)
    x["h",] <- (x["h",] + 0.5) %% 1
    hsv2col(x)
}
