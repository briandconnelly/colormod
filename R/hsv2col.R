# TODO: document
hsv2col <- function(color) {
    apply(color, 2, function(x) {
        hsv(h = x["h"], s = x["s"], v = x["v"])
    })
}
