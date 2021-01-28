contract C {
    bytes public b;
    constructor() {
        b = "abc";
    }
}
// ====
// compileViaYul: also
// ----
// b() -> 0x20, 0x03, 0x6162630000000000000000000000000000000000000000000000000000000000
// gas Legacy: 24597
// gas LegacyOptimized: 24337
// gas Yul: 23597
// gas YulOptimized: 22849
