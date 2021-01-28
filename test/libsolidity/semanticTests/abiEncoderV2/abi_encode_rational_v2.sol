// Tests that rational numbers (even negative ones) are encoded properly.
pragma abicoder               v2;


contract C {
    function f() public pure returns (bytes memory) {
        return abi.encode(1, -2);
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x20, 0x40, 0x1, -2
// gas Legacy: 22218
// gas LegacyOptimized: 21712
// gas Yul: 22794
// gas YulOptimized: 21775
