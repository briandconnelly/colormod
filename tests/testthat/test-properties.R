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
    
})
