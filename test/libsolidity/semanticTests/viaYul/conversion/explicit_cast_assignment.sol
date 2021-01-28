contract C {
    function f() public pure returns (uint16 x) {
        uint8 y = uint8(0x78);
        x = y;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x78
// gas Legacy: 21404
// gas LegacyOptimized: 21282
// gas Yul: 21954
// gas YulOptimized: 21229
