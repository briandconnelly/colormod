clamp <- function(value, min, max) {
    value[value < min] <- min
    value[value > max] <- max
    value
}
