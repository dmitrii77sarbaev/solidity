contract Test {
    function() internal x;

    function f() public returns (uint256 r) {
        x();
        return 2;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE, hex"4e487b71", 0x51
// gas Legacy: 22075
// gas LegacyOptimized: 22051
// gas Yul: 22390
// gas YulOptimized: 21229
