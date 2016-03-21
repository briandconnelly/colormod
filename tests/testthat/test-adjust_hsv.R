context("HSV Color manipulations")

medpurple3 <- "#8968CD"

# TODO test "Absolute" and "Relative"
test_that("HSV adjustments work properly", {
    expect_equal(adjust_hsv(medpurple3), medpurple3)
    expect_equal(adjust_hsv("#FFFFFF", h = 200), "#FFFFFF")
    expect_equal(adjust_hsv(col = medpurple3, h = -20, s = 0.04, v = -0.1),
                 "#5455B4")
})


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
