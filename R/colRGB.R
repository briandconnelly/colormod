#' Convert hex or named colors to colorspace RGB objects
#'
#' @param color One or more colors, either hex or named
#'
#' @return A list of class sRGB objects
#' @note Alpha values are ignored
#' @seealso \code{\link[colorspace]{RGB}}
#' @importFrom assertthat assert_that
#' @importFrom colorspace sRGB
#' @importFrom grDevices col2rgb
#' @export
#'
#' @examples
#' colRGB("orange")
#'
colRGB <- function(color) {
    assert_that(is.color(color))
    apply(X = col2rgb(color) / 255,
          MARGIN = 2,
          FUN = function(x) sRGB(R = x[["red"]], G = x[["green"]],
                                 B = x[["blue"]]))
}
