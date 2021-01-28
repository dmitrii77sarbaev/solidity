contract test {
    function f() public returns(uint ret) {
        ret = 1;
        for (;;) {
            ret += 1;
            if (ret >= 10) break;
        }
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 10
// gas Legacy: 23512
// gas LegacyOptimized: 22260
// gas Yul: 26311
// gas YulOptimized: 22448
