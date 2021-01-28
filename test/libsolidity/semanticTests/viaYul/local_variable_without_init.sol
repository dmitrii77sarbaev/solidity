contract C {
    function f() public pure returns (uint) {
        uint x;
        return x;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0
// gas Legacy: 21384
// gas LegacyOptimized: 21270
// gas Yul: 21773
// gas YulOptimized: 21229
