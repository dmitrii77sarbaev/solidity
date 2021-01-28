contract C {
    function f() public pure returns (uint16 x) {
        // tests that ``e`` is not converted to uint8
        // right before the exp
        uint16 e = 0x100;
        uint8 b = 0x2;
        unchecked {
            return b**e;
        }
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x00
// gas Legacy: 21542
// gas LegacyOptimized: 21282
// gas Yul: 22376
// gas YulOptimized: 21229
