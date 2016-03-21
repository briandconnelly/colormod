#' Adjust a color's transparency
#' 
#' \code{transparentize} increases a color's transparency, while \code{opacify}
#' decreases a color's transparency, making it more opaque.
#'
#' @inheritParams col2hsv
#' @param amount The amount to increase transparency [-1,1]
#' @param mode Whether the adjustments set the value directly
#'
#' @return The adjusted color(s) as hexadecimal strings
#' @export
#'
#' @examples
#' transparentize("orange, 0.1)
#'
transparentize <- function(col, amount, mode = "relative") {
    assertthat::assert_that(is.numeric(amount), amount >= -1, amount <= 1)
    assertthat::assert_that(tolower(mode) %in% c("relative", "absolute"))

    x <- col2rgb(col = col, alpha = TRUE)

    if (tolower(mode) == "relative") {
        x["alpha",] <- clamp(x["alpha",] - round(amount * 255), 0, 255)
    }
    else if (tolower(mode) == "absolute") {
        x["alpha",] <- clamp(round(amount * 255), 0, 255)
    }
    rgb2hex(x)
}


#' @rdname transparentize
#' @export
opacify <- function(col, amount, mode = "relative") {
    transparentize(col = col, amount = -1 * amount, mode = mode)
}
