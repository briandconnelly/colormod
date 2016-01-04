context("Color conversion")

library(colorspace)

c1 <- "#FFa312"
c2 <- "#000000"
c3 <- "#FFFFFF"
c4 <- "#7D26CD"
cnamed <- c("mediumpurple3", "orange", "violetred", "paleturquoise3",
            "lightsalmon3")
cnamedhex <- c("#8968CD", "#FFA500", "#D02090", "#96CDCD", "#CD8162")

test_that("Hex colors convert properly internally", {
    expect_equal(hex(c1), toupper(c1))
    expect_equal(hex(c2), toupper(c2))
    expect_equal(hex(c3), toupper(c3))
    expect_equal(hex(c4), toupper(c4))
    expect_error(hex(21))
    expect_equal(hex(c("#000000", "#FFFFFF")), c("#000000", "#FFFFFF"))
    expect_equal(hex(c(c(c1, c2, c3, c4))), toupper(c(c1, c2, c3, c4)))
})

test_that("Named colors convert properly", {
    expect_equal(hex("red"), "#FF0000")
    expect_equal(hex("blue"), "#0000FF")
    expect_equal(hex("green"), "#00FF00")
    expect_equal(hex("violetred"), "#D02090")
    expect_equal(hex("paleturquoise3"), "#96CDCD")
    expect_equal(hex("lightsalmon3"), "#CD8162")
    expect_equal(hex(cnamed), cnamedhex)
})


test_that("Colors convert properly to HSL", {
    expect_equal(hex(coordinates("#FFFFFF", "HLS")), hex(HLS(0,1,0)))
    expect_equal(hex(coordinates("#000000", "HLS")), hex(HLS(0,0,0)))
    expect_equal(hex(coordinates("#40bfbf", "HLS")), hex(HLS(180, 0.5, 0.5)))
})

test_that("Colors convert properly to HSV", {
    expect_equal(hex(coordinates("#FFFFFF", "HSV")), hex(HSV(0,0,1)))
    expect_equal(hex(coordinates("#000000", "HSV")), hex(HSV(0,0,0)))
    expect_equal(hex(coordinates("#408080", "HSV")), hex(HSV(180, 0.5, 0.5)))
})
