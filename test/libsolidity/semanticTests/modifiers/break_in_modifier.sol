contract C {
    uint256 public x;
    modifier run() {
        for (uint256 i = 0; i < 10; i++) {
            _;
            if (i == 1)
                break;
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
// gas Legacy: 44349
// gas LegacyOptimized: 43991
// gas Yul: 48200
// gas YulOptimized: 44055
// x() -> 2
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
