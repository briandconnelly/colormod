#' Convert colors to hexadecimal strings
#'
#' @param color One or more colors, either hex or named
#'
#' @return A vector of colors as hex strings
#' @importFrom assertthat assert_that
#' @importFrom colorspace hex
#' @export
#'
#' @examples
#' hex(c('mediumpurple3', 'orange'))
#'
hex <- function(color) {
    assert_that(is.color(color))
    sapply(colRGB(color), colorspace::hex)
}
