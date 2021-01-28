contract C {
    function f(bytes calldata x) public returns (bytes memory) {
        assembly { x.offset := 1 x.length := 3 }
        return x;
    }
}
// ====
// compileViaYul: also
// ----
// f(bytes): 0x20, 0, 0 -> 0x20, 3, 0x5754f80000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22679
// gas LegacyOptimized: 22289
// gas Yul: 23412
// gas YulOptimized: 22415
