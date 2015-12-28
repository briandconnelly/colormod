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
