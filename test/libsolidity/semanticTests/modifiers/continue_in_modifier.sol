contract C {
    uint256 public x;
    modifier run() {
        for (uint256 i = 0; i < 10; i++) {
            if (i % 2 == 1) continue;
            _;
        }
    }

    function f() public run {
        uint256 k = x;
        uint256 t = k + 1;
        x = t;
    }
}

// ====
// compileViaYul: also
// ----
// x() -> 0
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
// f() ->
// gas Legacy: 53530
// gas LegacyOptimized: 50930
// gas Yul: 64905
// gas YulOptimized: 50070
// x() -> 5
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
