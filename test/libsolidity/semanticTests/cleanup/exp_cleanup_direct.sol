contract C {
    function f() public pure returns (uint8 x) {
        unchecked {
            return uint8(0)**uint8(uint8(2)**uint8(8));
        }
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x1
// gas Legacy: 21485
// gas LegacyOptimized: 21282
// gas Yul: 22564
// gas YulOptimized: 21229
