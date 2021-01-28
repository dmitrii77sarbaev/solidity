contract test {
    function f() public returns(uint d) { return 0 ** 0; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 1
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21848
// gas YulOptimized: 21229
