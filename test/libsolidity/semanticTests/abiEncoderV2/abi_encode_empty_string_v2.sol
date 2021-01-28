// Tests that this will not end up using a "bytes0" type
// (which would assert)
pragma abicoder               v2;


contract C {
    function f() public pure returns (bytes memory, bytes memory) {
        return (abi.encode(""), abi.encodePacked(""));
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f() -> 0x40, 0xa0, 0x40, 0x20, 0x0, 0x0
// gas Legacy: 22723
// gas LegacyOptimized: 21998
// gas Yul: 23442
// gas YulOptimized: 22146
