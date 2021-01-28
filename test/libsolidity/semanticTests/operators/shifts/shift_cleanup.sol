contract C {
    function f() public returns (uint16 x) {
        unchecked {
            x = 0xffff;
            x += 32;
            x <<= 8;
            x >>= 16;
        }
    }
}

// ====
// compileViaYul: also
// ----
// f() -> 0x0
// gas Legacy: 21445
// gas LegacyOptimized: 21282
// gas Yul: 22758
// gas YulOptimized: 21229
