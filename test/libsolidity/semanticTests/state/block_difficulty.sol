contract C {
    function f() public returns (uint) {
        return block.difficulty;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 200000000
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
// f() -> 200000000
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
// f() -> 200000000
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
