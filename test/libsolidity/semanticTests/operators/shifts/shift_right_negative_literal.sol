contract C {
    function f1() public pure returns (bool) {
        return (-4266 >> 0) == -4266;
    }

    function f2() public pure returns (bool) {
        return (-4266 >> 1) == -2133;
    }

    function f3() public pure returns (bool) {
        return (-4266 >> 4) == -267;
    }

    function f4() public pure returns (bool) {
        return (-4266 >> 8) == -17;
    }

    function f5() public pure returns (bool) {
        return (-4266 >> 16) == -1;
    }

    function f6() public pure returns (bool) {
        return (-4266 >> 17) == -1;
    }

    function g1() public pure returns (bool) {
        return (-4267 >> 0) == -4267;
    }

    function g2() public pure returns (bool) {
        return (-4267 >> 1) == -2134;
    }

    function g3() public pure returns (bool) {
        return (-4267 >> 4) == -267;
    }

    function g4() public pure returns (bool) {
        return (-4267 >> 8) == -17;
    }

    function g5() public pure returns (bool) {
        return (-4267 >> 16) == -1;
    }

    function g6() public pure returns (bool) {
        return (-4267 >> 17) == -1;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f1() -> true
// gas Legacy: 21457
// gas LegacyOptimized: 21342
// gas Yul: 22147
// gas YulOptimized: 21622
// f2() -> true
// gas Legacy: 21524
// gas LegacyOptimized: 21409
// gas Yul: 22081
// gas YulOptimized: 21556
// f3() -> true
// gas Legacy: 21413
// gas LegacyOptimized: 21298
// gas Yul: 22103
// gas YulOptimized: 21578
// f4() -> true
// gas Legacy: 21479
// gas LegacyOptimized: 21364
// gas Yul: 22169
// gas YulOptimized: 21644
// f5() -> true
// gas Legacy: 21436
// gas LegacyOptimized: 21321
// gas Yul: 21993
// gas YulOptimized: 21468
// f6() -> true
// gas Legacy: 21502
// gas LegacyOptimized: 21387
// gas Yul: 22059
// gas YulOptimized: 21534
// g1() -> true
// gas Legacy: 21435
// gas LegacyOptimized: 21320
// gas Yul: 22125
// gas YulOptimized: 21600
// g2() -> true
// gas Legacy: 21480
// gas LegacyOptimized: 21365
// gas Yul: 22037
// gas YulOptimized: 21512
// g3() -> true
// gas Legacy: 21523
// gas LegacyOptimized: 21408
// gas Yul: 22213
// gas YulOptimized: 21688
// g4() -> true
// gas Legacy: 21458
// gas LegacyOptimized: 21343
// gas Yul: 22015
// gas YulOptimized: 21490
// g5() -> true
// gas Legacy: 21414
// gas LegacyOptimized: 21299
// gas Yul: 21971
// gas YulOptimized: 21446
// g6() -> true
// gas Legacy: 21501
// gas LegacyOptimized: 21386
// gas Yul: 22191
// gas YulOptimized: 21666
