#' @title Check whether input is a valid color
#'
#' @description \code{is.color} checks whether or not the given input is a valid
#' color
#' @rdname is.color
#'
#' @param x Vector containing either: \enumerate{
#'     \item a color name (see {\code{\link[grDevices]{colors}}})
#'     \item a hexadecimal string of the form "\code{#rrggbb}" or
#'     "\code{#rrggbbaa}"(see \code{\link[grDevices]{rgb}})
#' }
#' @param allow_alpha Whether or not alpha parameters are allowed in hex color
#' strings (default: \code{TRUE})
#'
#' @return Boolean indicating whether or not the given input is a valid color
#' @importFrom assertthat on_failure
#' @export
#'
#' @examples
#' is.color('turquoise2')
#' is.hex.color('#8BADF00D')
#'
is.color <- function(x, allow_alpha = TRUE) {
    if (allow_alpha) {
        hex <- grepl(pattern = "^#([a-fA-F0-9]{6}|[a-fA-F0-9]{8})$", x = x,
                     ignore.case = TRUE)
    }
    else hex <- grepl(pattern = "^#[a-fA-F0-9]{6}$", x = x, ignore.case = TRUE)

    named <- x %in% grDevices::colors()
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
is.hex.color <- function(x, allow_alpha = TRUE) {
    if (allow_alpha) p <- "^#([a-fA-F0-9]{6}|[a-fA-F0-9]{8})$"
    else p <- "^#[a-fA-F0-9]{6}$"

    all(grepl(pattern = p, x = x, ignore.case = TRUE))
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.hex.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid hex color")
}


#' @description \code{is.named.color} checks whether input is a valid named
#' color
#' @rdname is.color
#' @export
#' @seealso \code{\link{colors}}
is.named.color <- function(x) {
    all(x %in% grDevices::colors())
}

#' @importFrom assertthat on_failure
assertthat::on_failure(is.named.color) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid color name. See colors().")
}
