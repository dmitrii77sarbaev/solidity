contract C {
    function test() public returns (uint256) {
        // Note that this only works because computation on literals is done using
        // unbounded integers.
        if ((2**255 + 2**255) % 7 != addmod(2**255, 2**255, 7)) return 1;
        if ((2**255 + 2**255) % 7 != addmod(2**255, 2**255, 7)) return 2;
        return 0;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> 0
// gas Legacy: 21488
// gas LegacyOptimized: 21362
// gas Yul: 22718
// gas YulOptimized: 21229
