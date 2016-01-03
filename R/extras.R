clamp <- function(value, min, max) {
    max(min, min(max, value))
}
