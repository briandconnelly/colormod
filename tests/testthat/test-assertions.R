context("Assertions")

test_that("is.hex.color works with RGB strings", {
    expect_true(is.hex.color("#ff0011"))
    expect_false(is.hex.color("ff0011"))
    expect_false(is.hex.color("#fg0011"))
})

test_that("is.hex.color works with RGBa strongs", {
    expect_true(is.hex.color("#ff0011aa"))
    expect_false(is.hex.color("ff0011aa"))
    expect_false(is.hex.color("#fg0011aa"))
})

test_that("is.named.color works", {
    expect_true(is.named.color("papayawhip"))
    expect_false(is.named.color("catpukeorange"))
})

test_that("is.color works with both hex and RGB strings", {
    expect_true(is.color("#ff0011aa"))
    expect_true(is.color("papayawhip"))
    expect_false(is.color("catpukeorange"))
    expect_false(is.color("#fg0011"))
})
