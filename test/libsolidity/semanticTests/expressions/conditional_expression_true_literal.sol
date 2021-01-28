contract test {
    function f() public returns(uint d) {
        return true ? 5 : 10;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 5
// gas Legacy: 21403
// gas LegacyOptimized: 21270
// gas Yul: 22000
// gas YulOptimized: 21229
