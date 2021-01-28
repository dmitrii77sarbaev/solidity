contract test {
    function f() public returns(uint d) { return 2 ** 3; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 8
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21848
// gas YulOptimized: 21229
