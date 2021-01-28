contract C {
    function() internal returns (uint)[20] x;
    int256 mutex;

    function one() public returns (uint256) {
        function() internal returns (uint)[20] memory xmem;
        x = xmem;
        return 3;
    }

    function two() public returns (uint256) {
        if (mutex > 0) return 7;
        mutex = 1;
        // If this test fails, it might re-execute this function.
        x[0]();
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// one() -> 3
// gas Legacy: 154760
// gas LegacyOptimized: 154630
// gas Yul: 68207
// gas YulOptimized: 58809
// two() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 42980
// gas LegacyOptimized: 42883
// gas Yul: 44983
// gas YulOptimized: 42080
