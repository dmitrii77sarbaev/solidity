contract test {
    enum Choice {A, B, C}

    function answer() public returns (test.Choice _ret) {
        _ret = test.Choice.B;
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
