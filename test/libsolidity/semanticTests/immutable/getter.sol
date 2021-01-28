contract C {
    uint immutable public x = 1;
}
// ====
// compileViaYul: also
// ----
// x() -> 1
// gas Legacy: 21371
// gas LegacyOptimized: 21270
// gas Yul: 21716
// gas YulOptimized: 21229
