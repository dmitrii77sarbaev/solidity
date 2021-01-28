contract C {
    function f() public returns (bool) {
        return gasleft() > 0;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> true
// gas Legacy: 21390
// gas LegacyOptimized: 21289
// gas Yul: 21908
// gas YulOptimized: 21239
// f() -> true
// gas Legacy: 21390
// gas LegacyOptimized: 21289
// gas Yul: 21908
// gas YulOptimized: 21239
// f() -> true
// gas Legacy: 21390
// gas LegacyOptimized: 21289
// gas Yul: 21908
// gas YulOptimized: 21239
