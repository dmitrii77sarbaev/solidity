contract test {
    function f() public pure returns (uint r) {
        uint32 x;
        uint8 y;
        assembly {
            x := 0xfffffffffe
            y := 0x102
        }
        unchecked { r = x**y; }
        return r;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 4
// gas Legacy: 21486
// gas LegacyOptimized: 21270
// gas Yul: 22254
// gas YulOptimized: 21229
