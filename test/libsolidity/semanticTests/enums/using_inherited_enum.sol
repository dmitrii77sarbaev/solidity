contract base {
    enum Choice {A, B, C}
}


contract test is base {
    function answer() public returns (Choice _ret) {
        _ret = Choice.B;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// answer() -> 1
// gas Legacy: 21474
// gas LegacyOptimized: 21296
// gas Yul: 21863
// gas YulOptimized: 21229
