context("Color conversion")

library(colorspace)

c1 <- '#FFa312'
c2 <- '#000000'
c3 <- '#FFFFFF'

test_that("Hex colors convert properly", {
    expect_equal(hex(colRGB(c1)), hex(hex2RGB(c1)))
    expect_equal(hex(colRGB(c2)), hex(hex2RGB(c2)))
    expect_equal(hex(colRGB(c3)), hex(hex2RGB(c3)))
})

test_that("Named colors convert properly", {
    expect_equal(hex(colRGB("red")), "#FF0000")
    expect_equal(hex(colRGB("blue")), "#0000FF")
    expect_equal(hex(colRGB("green")), "#00FF00")
    expect_equal(hex(colRGB("violetred")), "#D02090")
    expect_equal(hex(colRGB("paleturquoise3")), "#96CDCD")
    expect_equal(hex(colRGB("lightsalmon3")), "#CD8162")
})
