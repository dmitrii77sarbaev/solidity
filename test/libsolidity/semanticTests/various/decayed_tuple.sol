contract C {
    function f() public returns (uint256) {
        uint256 x = 1;
        (x) = 2;
        return x;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2
// gas Legacy: 21400
// gas LegacyOptimized: 21270
// gas Yul: 21949
// gas YulOptimized: 21229
