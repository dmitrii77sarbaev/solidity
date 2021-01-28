contract C {
    function f() public returns (address) {
        return tx.origin;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 0x9292929292929292929292929292929292929292
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
// f() -> 0x9292929292929292929292929292929292929292
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
// f() -> 0x9292929292929292929292929292929292929292
// gas Legacy: 21427
// gas LegacyOptimized: 21293
// gas Yul: 21821
// gas YulOptimized: 21228
