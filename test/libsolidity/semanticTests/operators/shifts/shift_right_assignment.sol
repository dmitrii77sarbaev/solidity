contract C {
    function f(uint256 a, uint256 b) public returns (uint256) {
        a >>= b;
        return a;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 0x4266, 0x0 -> 0x4266
// gas Legacy: 22114
// gas LegacyOptimized: 21650
// gas Yul: 22658
// gas YulOptimized: 21518
// f(uint256,uint256): 0x4266, 0x8 -> 0x42
// gas Legacy: 22126
// gas LegacyOptimized: 21662
// gas Yul: 22670
// gas YulOptimized: 21530
// f(uint256,uint256): 0x4266, 0x10 -> 0
// gas Legacy: 22126
// gas LegacyOptimized: 21662
// gas Yul: 22670
// gas YulOptimized: 21530
// f(uint256,uint256): 0x4266, 0x11 -> 0
// gas Legacy: 22126
// gas LegacyOptimized: 21662
// gas Yul: 22670
// gas YulOptimized: 21530
