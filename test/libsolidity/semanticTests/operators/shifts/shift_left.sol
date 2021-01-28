contract C {
    function f(uint256 a, uint256 b) public returns (uint256) {
        return a << b;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 0x4266, 0x0 -> 0x4266
// gas Legacy: 22106
// gas LegacyOptimized: 21650
// gas Yul: 22606
// gas YulOptimized: 21518
// f(uint256,uint256): 0x4266, 0x8 -> 0x426600
// gas Legacy: 22118
// gas LegacyOptimized: 21662
// gas Yul: 22618
// gas YulOptimized: 21530
// f(uint256,uint256): 0x4266, 0x10 -> 0x42660000
// gas Legacy: 22118
// gas LegacyOptimized: 21662
// gas Yul: 22618
// gas YulOptimized: 21530
// f(uint256,uint256): 0x4266, 0x11 -> 0x84cc0000
// gas Legacy: 22118
// gas LegacyOptimized: 21662
// gas Yul: 22618
// gas YulOptimized: 21530
// f(uint256,uint256): 0x4266, 0xf0 -> 0x4266000000000000000000000000000000000000000000000000000000000000
// gas Legacy: 22118
// gas LegacyOptimized: 21662
// gas Yul: 22618
// gas YulOptimized: 21530
// f(uint256,uint256): 0x4266, 0x100 -> 0
// gas Legacy: 22118
// gas LegacyOptimized: 21662
// gas Yul: 22618
// gas YulOptimized: 21530
