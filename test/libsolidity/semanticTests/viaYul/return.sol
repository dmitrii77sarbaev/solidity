contract C {
    function f() public pure returns (uint x) {
        return 7;
        x = 3;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 7
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21848
// gas YulOptimized: 21229
