contract C {
    function f() public pure returns (uint8 x) {
        unchecked {
			uint16 x = 0x166;
            return uint8(x)**uint8(uint8(2)**uint8(8));
        }
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x1
// gas Legacy: 21498
// gas LegacyOptimized: 21282
// gas Yul: 22658
// gas YulOptimized: 21229
