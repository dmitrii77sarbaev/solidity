contract C {
    function f() public returns (uint) {
        return block.gaslimit;
    }
}
// ====
// compileViaYul: also
// ----
// f() -> 20000000
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
// f() -> 20000000
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
// f() -> 20000000
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
