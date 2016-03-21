context("Color conversion")

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
    expect_equal(hex("red", alpha = TRUE), "#FF0000FF")
    expect_error(hex("catpukeorange"))
    expect_equal(hex(c("#000000", "#FFFFFF")), c("#000000", "#FFFFFF"))
    expect_equal(hex(c(c(c1, c2, c3, c4))), toupper(c(c1, c2, c3, c4)))
})

test_that("Named colors convert properly", {
    expect_equal(hex("red"), "#FF0000")
    expect_equal(hex("blue", alpha = FALSE), "#0000FF")
    expect_equal(hex("green", alpha = TRUE), "#00FF00FF")
    expect_equal(hex("violetred", alpha = FALSE), "#D02090")
    expect_equal(hex("paleturquoise3", alpha = FALSE), "#96CDCD")
    expect_equal(hex("lightsalmon3"), "#CD8162")
    expect_equal(hex(cnamed), cnamedhex)
})
