context("RGB Color manipulations")

medpurple3 <- "#8968CD"

# TODO: one with vector
test_that("invert works properly", {
    expect_equal(invert(col = "#FF00FF"), "#00FF00")
    expect_equal(invert(col = "blue"), "#FFFF00")
    expect_equal(invert(col = "violetred"), "#2FDF6F")
})


# TODO: one with alpha
# TODO: one with vector
test_that("RGB adjustments work properly", {
    expect_equal(adjust_rgb(col = "#000000", r = 0, g = 0, b = 0), "#000000")
    expect_equal(adjust_rgb(col = "#FFFFFF", r = 1, g = 1, b = 1), "#FFFFFF")
})
