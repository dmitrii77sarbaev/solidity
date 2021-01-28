contract C {
    uint256 public x;
    modifier run() {
        for (uint256 i = 1; i < 10; i++) {
            if (i == 5) return;
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
// gas Legacy: 48640
// gas LegacyOptimized: 47804
// gas Yul: 56091
// gas YulOptimized: 47677
// x() -> 4
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
