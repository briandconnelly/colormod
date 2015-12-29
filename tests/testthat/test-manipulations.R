context("Color manipulations")

test_that("invert works properly", {
    expect_equal(invert(color = "#FF00FF", amount = 1), "#00FF00")
    expect_equal(invert(color = "blue", amount = 1), "#FFFF00")
    expect_equal(invert(color = "violetred", amount = 1), "#2FDF6F")
})

medpurple3 <- "#8968CD"

test_that("brightness adjustments work properly", {
    expect_equal(adjust_brightness(color = medpurple3, amount = 0), medpurple3)
    expect_equal(adjust_brightness(color = 'mediumpurple3', amount = 0),
                 medpurple3)
    expect_equal(lighten(color = medpurple3, amount = 0), medpurple3)
    expect_equal(lighten(color = '#FFFFFF', amount = 1), '#FFFFFF')
    expect_equal(lighten(color = '#FFFFFF', amount = -1), '#000000')
    expect_equal(lighten(color = '#000000', amount = 1), '#FFFFFF')
    expect_equal(lighten(color = '#000000', amount = 0.5), '#808080')
    expect_equal(darken(color = 'white', 0), '#FFFFFF')
    expect_equal(darken(color = 'white', 1), '#000000')
    expect_equal(darken(color = '#000000', 1), '#000000')
})

test_that("saturation adjustments work properly", {
    expect_equal(adjust_saturation(color = medpurple3, amount = 0), medpurple3)
    expect_equal(adjust_saturation(color = medpurple3, amount = 1), '#4300CD')
    expect_equal(desaturate(color = "#F00000", amount = 1), "#F0F0F0")
    expect_equal(saturate(color = "#F0F0F0", amount = 1), "#F00000")
    expect_equal(greyscale(color = '#CCCCCC'), '#CCCCCC')
    expect_equal(greyscale(color = medpurple3), '#CDCDCD')
    expect_equal(grayscale(color = medpurple3), '#CDCDCD')
})

test_that("hue adjustments work properly", {
    expect_equal(adjust_hue(color = "#807040", amount = 0, wrap = TRUE),
                 "#807040")
    expect_equal(adjust_hue(color = "#807040", amount = 180, wrap = TRUE),
                 "#405080")
    expect_equal(adjust_hue(color = "#405080", amount = 180, wrap = TRUE),
                 "#807040")
    expect_equal(complement(color = "#607080", wrap = TRUE), "#807060")
    expect_equal(complement(color = "#807060", wrap = TRUE), "#607080")
    expect_equal(complement(color = "#FFFFFF", wrap = TRUE), "#FFFFFF")
})
