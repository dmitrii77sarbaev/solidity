contract C {
    function f(uint256 a, uint8 b) public returns (uint256) {
        a <<= b;
        return a;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint8): 0x4266, 0x0 -> 0x4266
// gas Legacy: 22126
// gas LegacyOptimized: 21698
// gas Yul: 22626
// gas YulOptimized: 21566
// f(uint256,uint8): 0x4266, 0x8 -> 0x426600
// gas Legacy: 22138
// gas LegacyOptimized: 21710
// gas Yul: 22638
// gas YulOptimized: 21578
// f(uint256,uint8): 0x4266, 0x10 -> 0x42660000
// gas Legacy: 22138
// gas LegacyOptimized: 21710
// gas Yul: 22638
// gas YulOptimized: 21578
// f(uint256,uint8): 0x4266, 0x11 -> 0x84cc0000
// gas Legacy: 22138
// gas LegacyOptimized: 21710
// gas Yul: 22638
// gas YulOptimized: 21578
// f(uint256,uint8): 0x4266, 0xf0 -> 0x4266000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22138
// gas LegacyOptimized: 21710
// gas Yul: 22638
// gas YulOptimized: 21578
