contract C {
    function f() public returns (uint8 x) {
        assembly {
            x := 0xffff
        }
        x >>= 8;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x0
// gas Legacy: 21408
// gas LegacyOptimized: 21282
// gas Yul: 22130
// gas YulOptimized: 21229
