contract C {
    function f() public pure returns (bytes32 ret) {
        assembly {
            ret := keccak256(0, 0)
        }
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470
// gas Legacy: 21412
// gas LegacyOptimized: 21270
// gas Yul: 21793
// gas YulOptimized: 21267
