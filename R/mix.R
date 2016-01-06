#' @title Color mixing
#' @description \code{mix} mixes two colors together
#'
#' @param col1 One or more colors, either hex or named TODO: update description
#' @param col2 One or more colors, either hex or named
#' @inheritParams col2hsv
#' @param amount The amount of \code{col2} to add. For \code{shade} and \code{tint},
#' this is the amount of black and white, respectively, to add.
#'
#' @return The mixed colors as hexadecimal strings
#' @importFrom assertthat assert_that
#' @export
#'
#' @examples
#' mix('#FFFFFF', '#0000FF', 0.2)
#'
mix <- function(col1, col2, amount = 0.5) {
    assert_that(is.color(col1), is.color(col2))
    assert_that(is.numeric(amount), amount >= 0, amount <= 1.0)

    # As-is, col1 and col2 must be the same length
    # TODO: allow one of them to be length 1 (duplicate element length(other) times)
    #   as.matrix(rep(c1[,1], 3), nrow=3, ncol=3) doesn't quite work

    col1m <- col2rgb(col1)
    col2m <- col2rgb(col2)

    rgb2hex(round((col1m * (1 - amount)) + (col2m * amount)))
}


#' @description \code{shade} shades a given color, mixing it with black
#' @rdname mix
#' @export
shade <- function(col, amount) mix(col1 = col, col2 = "#000000",
                                   amount = amount)


#' @description \code{tint} tints a given color, mixing it with white
#' @rdname mix
#' @export
tint <- function(col, amount) mix(col1 = col, col2 = "#FFFFFF",
                                  amount = amount)
