contract C {
    function f() public returns (uint x, uint y) {
        assembly {
            x := true
            y := false
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1, 0
// gas Legacy: 21493
// gas LegacyOptimized: 21294
// gas Yul: 21884
// gas YulOptimized: 21241
