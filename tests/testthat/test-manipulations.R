context("Color manipulations")

test_that("invert works properly", {
    expect_equal(invert(col = "#FF00FF", amount = 1), "#00FF00")
    expect_equal(invert(col = "blue", amount = 1), "#FFFF00")
    expect_equal(invert(col = "violetred", amount = 1), "#2FDF6F")
})

medpurple3 <- "#8968CD"

test_that("brightness adjustments work properly", {
    expect_equal(adjust_brightness(col = medpurple3, amount = 0), medpurple3)
    expect_equal(adjust_brightness(col = "mediumpurple3", amount = 0),
                 medpurple3)
    expect_equal(adjust_brightness(col = "#000000", amount = 0.8),
                 "#CCCCCC")
    expect_equal(adjust_lightness(col = "mediumpurple3", amount = 0),
                 medpurple3)
    expect_equal(adjust_lightness(col = "#FFFFFF", amount = -0.5),
                 "#808080")
    expect_equal(lighten(col = medpurple3, amount = 0), medpurple3)
    expect_equal(lighten(col = "#FFFFFF", amount = 1), "#FFFFFF")
    expect_equal(lighten(col = "#FFFFFF", amount = -1), "#000000")
    expect_equal(lighten(col = "#000000", amount = 1), "#FFFFFF")
    expect_equal(lighten(col = "#000000", amount = 0.5), "#808080")
    expect_equal(darken(col = "white", 0), "#FFFFFF")
    expect_equal(darken(col = "white", 1), "#000000")
    expect_equal(darken(col = "#000000", 1), "#000000")
})

test_that("saturation adjustments work properly", {
    expect_equal(adjust_saturation(col = medpurple3, amount = 0), medpurple3)
    expect_equal(adjust_saturation(col = medpurple3, amount = 1), "#4300CD")
    expect_equal(desaturate(col = "#F00000", amount = 1), "#F0F0F0")
    expect_equal(saturate(col = "#F0F0F0", amount = 1, space = "HSV"),
                 "#F00000")
    expect_equal(saturate(col = "#F0F0F0", amount = 1, space = "HSL"),
                 "#FFE1E1")
    expect_equal(greyscale(col = "#CCCCCC"), "#CCCCCC")
    expect_equal(greyscale(col = medpurple3), "#CDCDCD")
    expect_equal(grayscale(col = medpurple3), "#CDCDCD")
})

test_that("hue adjustments work properly", {
    expect_equal(adjust_hue(col = "#807040", amount = 0, space = "HSV",
                            wrap = TRUE),
                 "#807040")
    expect_equal(adjust_hue(col = "#807040", amount = 180, space = "HSV",
                            wrap = TRUE),
                 "#405080")
    expect_equal(adjust_hue(col = "#405080", amount = 180, space = "HSV",
                            wrap = TRUE),
                 "#807040")
    expect_equal(adjust_hue(col = "#405080", amount = 180, space = "HSL",
                            wrap = TRUE),
                 "#807040")
    expect_equal(complement(col = "#607080", space = "HSV", wrap = TRUE),
                 "#807060")
    expect_equal(complement(col = "#607080", space = "HSL", wrap = TRUE),
                 "#807060")
    expect_equal(complement(col = "#807060", space = "HSV", wrap = TRUE),
                 "#607080")
    expect_equal(complement(col = "#FFFFFF", space = "HSV", wrap = TRUE),
                 "#FFFFFF")
    expect_equal(complement(complement(medpurple3)), medpurple3)
})

test_that("RGB adjustments work properly", {
    expect_equal(adjust_rgb(col = "#000000",
                            Ramount = 0, Gamount = 0, Bamount = 0),
                 "#000000")
    expect_equal(adjust_rgb(col = "#FFFFFF",
                            Ramount = 1, Gamount = 1, Bamount = 1),
                 "#FFFFFF")
    expect_equal(adjust_red(col = "#000000", amount = 1), "#FF0000")
    expect_equal(adjust_green(col = "#000000", amount = 1), "#00FF00")
    expect_equal(adjust_blue(col = "#000000", amount = 1), "#0000FF")
})

test_that("HSV adjustments work properly", {
    expect_equal(adjust_hsv(medpurple3), medpurple3)
    expect_equal(adjust_hsv("#FFFFFF", Hamount = 200), "#FFFFFF")
    expect_equal(adjust_hsv(col = medpurple3, Hamount = -20, Samount = 0.04,
                            Vamount = -0.1),
                 "#5455B4")
})

test_that("HSL adjustments work properly", {
    expect_equal(adjust_hsl(medpurple3), medpurple3)
    expect_equal(adjust_hsl(col = "orange3", Hamount = 20, Samount = -0.2,
                            Lamount = 0.15),
                 "#E8E531")
})
