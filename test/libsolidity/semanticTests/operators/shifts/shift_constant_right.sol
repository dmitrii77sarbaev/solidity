contract C {
    uint256 public a = 0x4200 >> 8;
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// a() -> 0x42
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
