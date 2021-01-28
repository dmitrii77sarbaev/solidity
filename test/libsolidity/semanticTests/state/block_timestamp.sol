contract C {
    constructor() {}
    function f() public returns (uint) {
        return block.timestamp;
    }
}
// ====
// compileViaYul: also
// ----
// constructor() # This is the 1st block #
// gas Legacy: 101385
// gas LegacyOptimized: 92135
// gas Yul: 130626
// gas YulOptimized: 70095
// f() -> 0x1e # This is the 2nd block (each block is "15 seconds") #
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
// f() -> 0x2d # This is the 3rd block #
// gas Legacy: 21378
// gas LegacyOptimized: 21269
// gas Yul: 21759
// gas YulOptimized: 21228
