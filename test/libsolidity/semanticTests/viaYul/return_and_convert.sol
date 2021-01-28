contract C {
    function f() public pure returns (uint) {
        uint8 b;
        assembly { b := 0xffff }
        return b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 255
// gas Legacy: 21398
// gas LegacyOptimized: 21270
// gas Yul: 21911
// gas YulOptimized: 21229
