contract C {
    uint256 public x;
    modifier m() {
        for (uint256 i = 0; i < 10; i++) {
            _;
            ++x;
            return;
        }
    }

    function f() public m m m returns (uint) {
        for (uint256 i = 0; i < 10; i++) {
            ++x;
            return 42;
        }
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
// f() -> 42
// gas Legacy: 47793
// gas LegacyOptimized: 47328
// gas Yul: 54539
// gas YulOptimized: 45819
// x() -> 4
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22722
// gas YulOptimized: 22147
