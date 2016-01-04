context("Color manipulations")

test_that("invert works properly", {
    expect_equal(invert(color = "#FF00FF", amount = 1), "#00FF00")
    expect_equal(invert(color = "blue", amount = 1), "#FFFF00")
    expect_equal(invert(color = "violetred", amount = 1), "#2FDF6F")
})

medpurple3 <- "#8968CD"

test_that("brightness adjustments work properly", {
    expect_equal(adjust_brightness(color = medpurple3, amount = 0), medpurple3)
    expect_equal(adjust_brightness(color = "mediumpurple3", amount = 0),
                 medpurple3)
    expect_equal(adjust_brightness(color = "#000000", amount = 0.8),
                 "#CCCCCC")
    expect_equal(adjust_lightness(color = "mediumpurple3", amount = 0),
                 medpurple3)
    expect_equal(adjust_lightness(color = "#FFFFFF", amount = -0.5),
                 "#808080")
    expect_equal(lighten(color = medpurple3, amount = 0), medpurple3)
    expect_equal(lighten(color = "#FFFFFF", amount = 1), "#FFFFFF")
    expect_equal(lighten(color = "#FFFFFF", amount = -1), "#000000")
    expect_equal(lighten(color = "#000000", amount = 1), "#FFFFFF")
    expect_equal(lighten(color = "#000000", amount = 0.5), "#808080")
    expect_equal(darken(color = "white", 0), "#FFFFFF")
    expect_equal(darken(color = "white", 1), "#000000")
    expect_equal(darken(color = "#000000", 1), "#000000")
})

test_that("saturation adjustments work properly", {
    expect_equal(adjust_saturation(color = medpurple3, amount = 0), medpurple3)
    expect_equal(adjust_saturation(color = medpurple3, amount = 1), "#4300CD")
    expect_equal(desaturate(color = "#F00000", amount = 1), "#F0F0F0")
    expect_equal(saturate(color = "#F0F0F0", amount = 1, space = "HSV"),
                 "#F00000")
    expect_equal(saturate(color = "#F0F0F0", amount = 1, space = "HSL"),
                 "#FFE1E1")
    expect_equal(greyscale(color = "#CCCCCC"), "#CCCCCC")
    expect_equal(greyscale(color = medpurple3), "#CDCDCD")
    expect_equal(grayscale(color = medpurple3), "#CDCDCD")
})

test_that("hue adjustments work properly", {
    expect_equal(adjust_hue(color = "#807040", amount = 0, space = "HSV",
                            wrap = TRUE),
                 "#807040")
    expect_equal(adjust_hue(color = "#807040", amount = 180, space = "HSV",
                            wrap = TRUE),
                 "#405080")
    expect_equal(adjust_hue(color = "#405080", amount = 180, space = "HSV",
                            wrap = TRUE),
                 "#807040")
    expect_equal(adjust_hue(color = "#405080", amount = 180, space = "HSL",
                            wrap = TRUE),
                 "#807040")
    expect_equal(complement(color = "#607080", space = "HSV", wrap = TRUE),
                 "#807060")
    expect_equal(complement(color = "#607080", space = "HSL", wrap = TRUE),
                 "#807060")
    expect_equal(complement(color = "#807060", space = "HSV", wrap = TRUE),
                 "#607080")
    expect_equal(complement(color = "#FFFFFF", space = "HSV", wrap = TRUE),
                 "#FFFFFF")
    expect_equal(complement(complement(medpurple3)), medpurple3)
})

test_that("RGB adjustments work properly", {
    expect_equal(adjust_rgb(color = "#000000",
                            Ramount = 0, Gamount = 0, Bamount = 0),
                 "#000000")
    expect_equal(adjust_rgb(color = "#FFFFFF",
                            Ramount = 1, Gamount = 1, Bamount = 1),
                 "#FFFFFF")
    expect_equal(adjust_red(color = "#000000", amount = 1), "#FF0000")
    expect_equal(adjust_green(color = "#000000", amount = 1), "#00FF00")
    expect_equal(adjust_blue(color = "#000000", amount = 1), "#0000FF")
})

test_that("HSV adjustments work properly", {
    expect_equal(adjust_hsv(medpurple3), medpurple3)
    expect_equal(adjust_hsv("#FFFFFF", Hamount = 200), "#FFFFFF")
    expect_equal(adjust_hsv(color = medpurple3, Hamount = -20, Samount = 0.04,
                            Vamount = -0.1),
                 "#5455B4")
})

test_that("HSL adjustments work properly", {
    expect_equal(adjust_hsl(medpurple3), medpurple3)
    expect_equal(adjust_hsl(color = "orange3", Hamount = 20, Samount = -0.2,
                            Lamount = 0.15),
                 "#E8E531")
})
