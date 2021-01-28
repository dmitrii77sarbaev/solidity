contract test {
    int8 public x = 2;
    int8 public y = 127;
    int16 public q = 250;
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// x() -> 2
// gas Legacy: 22214
// gas LegacyOptimized: 22095
// gas Yul: 22738
// gas YulOptimized: 22256
// y() -> 127
// gas Legacy: 22289
// gas LegacyOptimized: 22128
// gas Yul: 22760
// gas YulOptimized: 22284
// q() -> 250
// gas Legacy: 22311
// gas LegacyOptimized: 22147
// gas Yul: 22782
// gas YulOptimized: 22306
