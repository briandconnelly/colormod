context("Color properties")

medpurple3 <- "#8968CD"

test_that("RGB properties work properly", {
    expect_equal(red("#000000"), 0)
    expect_equal(green("#000000"), 0)
    expect_equal(blue("#000000"), 0)
    expect_equal(alpha("#FFFFFF"), 1)
    expect_equal(alpha("orange"), 1)
    expect_equal(round(x = alpha("#FFFFFF80"), digits = 2), 0.50)
    expect_equal(red("#FF0000"), 1)
    expect_equal(green("#00FF00"), 1)
    expect_equal(blue("#0000FF"), 1)
})

test_that("HSV properties work properly", {
    expect_equal(hue(col = "#807040"), 0.125)
    expect_equal(hue(col = "#008080"), 0.5)
    expect_equal(saturation(col = "#FF0000"), 1)
    expect_equal(saturation(col = "orange"), 1)
    expect_equal(saturation(col = "#FFFFFF"), 0)
    expect_equal(brightness(col = "#FFFFFF"), 1)
    expect_equal(brightness(col = "#000000"), 0)
    expect_equal(round(x = brightness(col = "#6C6C6C"), digits = 2), 0.42)
})
