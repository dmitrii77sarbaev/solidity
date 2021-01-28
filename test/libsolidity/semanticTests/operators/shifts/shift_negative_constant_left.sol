contract C {
    int256 public a = -0x42 << 8;
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// a() -> -16896
// gas Legacy: 22171
// gas LegacyOptimized: 22070
// gas Yul: 22721
// gas YulOptimized: 22034
