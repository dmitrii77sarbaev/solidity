contract test {
    function f() public returns(int d) { return (-2) ** 3; }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> -8
// gas Legacy: 21379
// gas LegacyOptimized: 21273
// gas Yul: 21851
// gas YulOptimized: 21232
