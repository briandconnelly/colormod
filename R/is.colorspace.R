#' @title Check whether input is a supported colorspace
#' 
#' @description \code{is.colorspace} checks whether or not the given input is a
#' valid colorspace (i.e., one supported by this package)
#'
#' @param x A string containing a colorspace name
#'
#' @return Boolean indicating whether or not the given input is a valid
#' colorspace
#' @importFrom assertthat on_failure
#' @export
#'
#' @examples
#' is.colorspace('hsv')
#'
is.colorspace <- function(x) {
    toupper(x) %in% c("RGB", "HSV", "HSL", "HLS")
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.colorspace) <- function(call, env) {
    paste0(deparse(call$x), " is not a supported colorspace")
}
