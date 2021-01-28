contract C {
    function f(uint32 a, uint32 b) public returns (uint256) {
        return a >> b;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint32,uint32): 0x4266, 0x0 -> 0x4266
// gas Legacy: 22136
// gas LegacyOptimized: 21810
// gas Yul: 22774
// gas YulOptimized: 21843
// f(uint32,uint32): 0x4266, 0x8 -> 0x42
// gas Legacy: 22148
// gas LegacyOptimized: 21822
// gas Yul: 22786
// gas YulOptimized: 21855
// f(uint32,uint32): 0x4266, 0x10 -> 0
// gas Legacy: 22148
// gas LegacyOptimized: 21822
// gas Yul: 22786
// gas YulOptimized: 21855
// f(uint32,uint32): 0x4266, 0x11 -> 0
// gas Legacy: 22148
// gas LegacyOptimized: 21822
// gas Yul: 22786
// gas YulOptimized: 21855
