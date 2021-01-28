contract c {
    enum Truth {False, True}

    function test() public returns (uint256) {
        return uint256(Truth(uint8(0x1)));
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// test() -> 1
// gas Legacy: 21437
// gas LegacyOptimized: 21270
// gas Yul: 22198
// gas YulOptimized: 21229
