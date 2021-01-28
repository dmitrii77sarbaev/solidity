contract test {
    function f() public returns(uint d) {
        return false ? 5 : 10;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 10
// gas Legacy: 21413
// gas LegacyOptimized: 21270
// gas Yul: 21990
// gas YulOptimized: 21229
