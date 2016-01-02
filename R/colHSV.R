#' Convert hex or named colors to colorspace HSV objects
#'
#' @param color One or more colors, either hex or named
#'
#' @return A list of class HSV objects
#' @note Alpha values are ignored
#' @seealso \code{\link[colorspace]{HSV}}
#' @importFrom assertthat assert_that
#' @importFrom colorspace HSV
#' @importFrom colorspace RGB
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' colHSV("orange")
#'
colHSV <- function(color) {
    assert_that(is.color(color))
    rgb <- apply(X = col2rgb(color) / 255,
                 MARGIN = 2,
                 FUN = function(x) RGB(R = x[["red"]], G = x[["green"]],
                                       B = x[["blue"]]))
    lapply(rgb, function(x) as(x, 'HSV'))
}
