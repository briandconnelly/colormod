context("Assertions")

test_that("is.hex.color works with RGB strings", {
    expect_true(is.hex.color("#ff0011", allow_alpha = TRUE))
    expect_true(is.hex.color("#ff0011", allow_alpha = FALSE))
    expect_false(is.hex.color("ff0011"))
    expect_false(is.hex.color("#fg0011"))
})

test_that("is.hex.color works with RGBa strongs", {
    expect_true(is.hex.color("#ff0011aa", allow_alpha = TRUE))
    expect_false(is.hex.color("ff0011aa", allow_alpha = TRUE))
    expect_false(is.hex.color("#fg0011aa", allow_alpha = TRUE))
    expect_false(is.hex.color("#ff0011aa", allow_alpha = FALSE))
})

test_that("is.named.color works", {
    expect_true(is.named.color("papayawhip"))
    expect_false(is.named.color("catpukeorange"))
})

test_that("is.color works with both hex and RGB strings", {
    expect_true(is.color("#ff0011aa", allow_alpha = TRUE))
    expect_false(is.color("#ff0011aa", allow_alpha = FALSE))
    expect_true(is.color("#ff0011", allow_alpha = FALSE))
    expect_true(is.color("papayawhip"))
    expect_false(is.color("catpukeorange"))
    expect_false(is.color("#fg0011"))
})

test_that("is.colorspace works", {
    expect_true(is.colorspace(c("rgb", "srgb", "hsl", "hls", "hsv", "xyz",
                                "lab")))
    expect_true(is.colorspace(c("RGB", "sRGB", "HSL", "HLS", "HSV", "XYZ",
                                "LAB")))
})
