contract C {
    constructor() {}
    function f() public returns (uint) {
        return block.number;
    }
}
// ====
// compileViaYul: also
// ----
// constructor()
// gas Legacy: 101385
// gas LegacyOptimized: 92135
// gas Yul: 130626
// gas YulOptimized: 70095
// f() -> 2
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
// f() -> 3
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
