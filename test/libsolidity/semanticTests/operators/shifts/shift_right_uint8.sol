contract C {
    function f(uint8 a, uint8 b) public returns (uint256) {
        return a >> b;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint8,uint8): 0x66, 0x0 -> 0x66
// gas Legacy: 22124
// gas LegacyOptimized: 21798
// gas Yul: 22762
// gas YulOptimized: 21826
// f(uint8,uint8): 0x66, 0x8 -> 0x0
// gas Legacy: 22136
// gas LegacyOptimized: 21810
// gas Yul: 22774
// gas YulOptimized: 21838
