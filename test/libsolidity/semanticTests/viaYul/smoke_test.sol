contract C {
}
// ====
// allowNonExistingFunctions: true
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> FAILURE
// gas Legacy: 21088
// gas LegacyOptimized: 21088
// gas Yul: 21181
// gas YulOptimized: 21088
