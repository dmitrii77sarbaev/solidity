contract C {
    uint8[33] a;

    function f() public returns (uint8, uint8, uint8) {
        a[0] = 2;
        a[16] = 3;
        a[32] = 4;
        uint8[33] memory m = a;
        return (m[0], m[16], m[32]);
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 2, 3, 4
// gas Legacy: 98154
// gas LegacyOptimized: 95538
// gas Yul: 79755
// gas YulOptimized: 69853
