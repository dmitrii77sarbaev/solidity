contract C {
    function f() public pure returns (bytes calldata x) {
        assembly { x.offset := 0 x.length := 4 }
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x20, 4, 0x26121ff000000000000000000000000000000000000000000000000000000000
// gas Legacy: 21600
// gas LegacyOptimized: 21386
// gas Yul: 22012
// gas YulOptimized: 21271
