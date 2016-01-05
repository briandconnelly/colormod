# TODO: document
rgb2hex <- function(color) {
    apply(color, 2, function (x) {
        sprintf("#%02X%02X%02X", x["red"], x["green"], x["blue"])
    })
}
