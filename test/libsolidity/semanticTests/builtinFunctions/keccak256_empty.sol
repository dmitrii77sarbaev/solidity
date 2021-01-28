contract C {
    function f() public returns (bytes32) {
        return keccak256("");
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
// gas Legacy: 21379
// gas LegacyOptimized: 21270
// gas Yul: 21760
// gas YulOptimized: 21229
