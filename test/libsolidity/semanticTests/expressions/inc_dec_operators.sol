contract test {
    uint8 x;
    uint v;
    function f() public returns (uint r) {
        uint a = 6;
        r = a;
        r += (a++) * 0x10;
        r += (++a) * 0x100;
        v = 3;
        r += (v++) * 0x1000;
        r += (++v) * 0x10000;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x053866
// gas Legacy: 46832
// gas LegacyOptimized: 44685
// gas Yul: 51468
// gas YulOptimized: 43861
