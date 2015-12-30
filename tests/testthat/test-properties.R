context("Color properties")

medpurple3 <- "#8968CD"

test_that("RGB properties work properly", {
    expect_equal(red('#000000'), 0)
    expect_equal(green('#000000'), 0)
    expect_equal(blue('#000000'), 0)
    expect_equal(red('#FF0000'), 1)
    expect_equal(green('#00FF00'), 1)
    expect_equal(blue('#0000FF'), 1)
})

test_that("HSV properties work properly", {
    expect_equal(hue(color = "#807040"), 45)
    expect_equal(hue(color = "#008080"), 180)
    expect_equal(saturation(color = "#FF0000"), 1)
    expect_equal(saturation(color = "orange"), 1)
    expect_equal(saturation(color = "#FFFFFF"), 0)  
    expect_equal(brightness(color = "#FFFFFF"), 1)
    expect_equal(brightness(color = "#000000"), 0)
    expect_equal(round(x = brightness(color = "#6C6C6C"), digits = 2), 0.42)
})
