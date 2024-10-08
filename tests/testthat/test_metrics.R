plans <- plans_10[, 1:2]

test_that("redist.metrics works", {
    metr <- redist.metrics(
        plans = plans,
        measure = "all",
        rvote = fl25$mccain,
        dvote = fl25$obama
    )
    expected <- structure(list(district = c(1L, 2L, 3L, 1L, 2L, 3L), DSeats = c(
        0L,
        0L, 0L, 0L, 0L, 0L
    ), DVS = c(
        0.360156760287394, 0.461532961532962,
        0.468991002570694, 0.371380676622981, 0.461532961532962, 0.442667760010933
    ), EffGap = c(
        0.370787726538669, 0.370787726538669, 0.370787726538669,
        0.370787726538669, 0.370787726538669, 0.370787726538669
    ), EffGapEqPop = c(
        0.3604538162607,
        0.3604538162607, 0.3604538162607, 0.350387598777917, 0.350387598777917,
        0.350387598777917
    ), TauGap = c(
        0.912010389346749, 0.912010389346749,
        0.912010389346749, 0.914761483453797, 0.914761483453797, 0.914761483453797
    ), MeanMedian = c(
        -0.0313060534026117, -0.0313060534026117, -0.0313060534026117,
        -0.0174739606219749, -0.0174739606219749, -0.0174739606219749
    ), Bias = c(
        -0.166666666666667, -0.166666666666667, -0.166666666666667,
        -0.166666666666667, -0.166666666666667, -0.166666666666667
    ), BiasV = c(
        -0.166666666666667,
        -0.166666666666667, -0.166666666666667, -0.166666666666667, -0.166666666666667,
        -0.166666666666667
    ), Declination = c(
        NaN, NaN, NaN, NaN, NaN,
        NaN
    ), Responsiveness = c(0, 0, 0, 0, 0, 0), LopsidedWins = c(
        NaN,
        NaN, NaN, NaN, NaN, NaN
    ), RankedMarginal = c(
        1.34373625623872,
        1.34373625623872, 1.34373625623872, 1.34373625623872, 1.34373625623872,
        1.34373625623872
    ), SmoothedSeat = c(0.94160363086233, 0.94160363086233,
        0.94160363086233, 0.928561943964945, 0.928561943964945,
        0.928561943964945
    ), draw = c(1, 1, 1, 2, 2, 2)), row.names = c(NA, -6L), class = c(
        "tbl_df",
        "tbl", "data.frame"
    ))
    expect_equal(metr, expected)
})
