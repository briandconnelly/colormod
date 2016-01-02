#' Convert hex or named colors to colorspace HLS objects
#'
#' @param color One or more colors, either hex or named
#'
#' @return A list of class HLS objects
#' @note Alpha values are ignored
#' @seealso \code{\link[colorspace]{HLS}}
#' @importFrom assertthat assert_that
#' @importFrom colorspace HLS
#' @importFrom colorspace RGB
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' colHLS("orange")
#'
colHLS <- function(color) {
    assert_that(is.color(color))
    rgb <- apply(X = col2rgb(color) / 255,
                 MARGIN = 2,
                 FUN = function(x) RGB(R = x[["red"]], G = x[["green"]],
                                       B = x[["blue"]]))
    lapply(rgb, function(x) as(x, 'HLS'))
}

#' @rdname colHLS
#' @export
colHSL <- colHLS
