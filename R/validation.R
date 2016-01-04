#' @title Check whether input is a valid color
#'
#' @description \code{is.color} checks whether or not the given input is a valid
#' color
#' @rdname is.color
#'
#' @param x A color string
#'
#' @return Boolean indicating whether or not the given input is a valid color
#' @importFrom assertthat on_failure
#' @export
#'
#' @examples
#' is.color('turquoise2')
#' is.hex.color('#8BADF00D')
#'
is.color <- function(x) {
    hex <- grepl(pattern = "^#([a-fA-F0-9]{6}|[a-fA-F0-9]{8})$", x = x,
                 ignore.case = TRUE)
    named <- x %in% colors()
    all(hex | named)
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid color")
}


#' @description \code{is.hex.color} checks whether input is a valid hex color
#' (with or without alpha component)
#' @rdname is.color
#' @export
is.hex.color <- function(x) {
    m <- grepl(pattern = "^#([a-fA-F0-9]{6}|[a-fA-F0-9]{8})$", x = x,
               ignore.case = TRUE)
    all(m)
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.hex.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid hex color")
}


#' @description \code{is.named.color} checks whether input is a valid named
#' color
#' @rdname is.color
#' @importFrom grDevices colors
#' @export
#' @seealso \code{\link{colors}}
is.named.color <- function(x) {
    all(x %in% colors())
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.named.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a named color known by R")
}
