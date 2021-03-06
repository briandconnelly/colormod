context("Color mixing")

test_that("mix works properly", {
    expect_equal(mix("#FF0000", "#0000FF", 0), "#FF0000")
    expect_equal(mix("#FF0000", "#0000FF", 1), "#0000FF")
    expect_equal(mix("#FF0000", "#0000FF", 0.5), "#800080")
    expect_equal(mix(c("white", "white"), c("black", "black")),
                 c("#808080", "#808080"))
})

test_that("tint works properly", {
    expect_equal(tint(col = "#FF00FF", amount = 0), "#FF00FF")
    expect_equal(tint(col = "#FF00FF", amount = 1), "#FFFFFF")
    expect_equal(tint(col = "#FF00FF", amount = 0.5), "#FF80FF")
})

test_that("shade works properly", {
    expect_equal(shade(col = "#FF00FF", amount = 0), "#FF00FF")
    expect_equal(shade(col = "#FF00FF", amount = 1), "#000000")
    expect_equal(shade(col = "#FF00FF", amount = 0.5), "#800080")
})
