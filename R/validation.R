#' @title Check whether input is a valid color
#' 
#' @description \code{is.color} checks whether or not the given input is a valid color
#' @rdname is.color
#'
#' @param x A color string
#'
#' @return Boolean indicating whether or not the given input is a valid color
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.string
#' @export
#'
#' @examples
#' \dontrun{
#' is.color('turquoise2')
#' is.hex.color('#8BADF00D')
#' }
#' 
is.color <- function(x) {
    assert_that(is.string(x))
    is.hex.color(x) | is.named.color(x)
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid color")
}


#' @description \code{is.hex.color} checks whether input is a valid hex color (with or without alpha component)
#' @rdname is.color
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.string
#' @export
is.hex.color <- function(x) {
    assert_that(is.string(x))
    regexpr(pattern = "^#[[:xdigit:]]{6}$", text = x, ignore.case = TRUE) == 1 || regexpr(pattern = "^#[[:xdigit:]]{8}$", text = x, ignore.case = TRUE) == 1
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.hex.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid hex color")
}


#' @description \code{is.named.color} checks whether input is a valid named color
#' @rdname is.color
#' @importFrom assertthat assert_that
#' @importFrom assertthat is.string
#' @importFrom grDevices colors
#' @export
#' @seealso \code{\link{colors}}
is.named.color <- function(x) {
    assert_that(is.string(x))
    x %in% colors()
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.named.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a named color known by R")
}
