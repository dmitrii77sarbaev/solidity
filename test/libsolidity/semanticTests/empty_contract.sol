contract test {
}
// ====
// allowNonExistingFunctions: true
// compileToEwasm: also
// compileViaYul: also
// ----
// i_am_not_there() -> FAILURE
// gas Legacy: 21088
// gas LegacyOptimized: 21088
// gas Yul: 21181
// gas YulOptimized: 21088
