contract C {
    function f(uint a, uint b) public pure returns (uint x) {
        x = a % b;
    }
    function g(uint8 a, uint8 b) public pure returns (uint8 x) {
        x = a % b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 10, 3 -> 1
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(uint256,uint256): 10, 2 -> 0
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(uint256,uint256): 11, 2 -> 1
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(uint256,uint256): 2, 2 -> 0
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(uint256,uint256): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22066
// gas LegacyOptimized: 21633
// gas Yul: 22157
// gas YulOptimized: 21565
// f(uint256,uint256): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22054
// gas LegacyOptimized: 21621
// gas Yul: 22145
// gas YulOptimized: 21553
// f(uint256,uint256): 0, 1 -> 0
// gas Legacy: 22266
// gas LegacyOptimized: 21707
// gas Yul: 22579
// gas YulOptimized: 21762
// g(uint8,uint8): 10, 3 -> 1
// gas Legacy: 22330
// gas LegacyOptimized: 21922
// gas Yul: 22643
// gas YulOptimized: 22053
// g(uint8,uint8): 10, 2 -> 0
// gas Legacy: 22330
// gas LegacyOptimized: 21922
// gas Yul: 22643
// gas YulOptimized: 22053
// g(uint8,uint8): 11, 2 -> 1
// gas Legacy: 22330
// gas LegacyOptimized: 21922
// gas Yul: 22643
// gas YulOptimized: 22053
// g(uint8,uint8): 2, 2 -> 0
// gas Legacy: 22330
// gas LegacyOptimized: 21922
// gas Yul: 22643
// gas YulOptimized: 22053
// g(uint8,uint8): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22112
// gas LegacyOptimized: 21800
// gas Yul: 22203
// gas YulOptimized: 21823
// g(uint8,uint8): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22100
// gas LegacyOptimized: 21788
// gas Yul: 22191
// gas YulOptimized: 21811
// g(uint8,uint8): 0, 1 -> 0
// gas Legacy: 22318
// gas LegacyOptimized: 21910
// gas Yul: 22631
// gas YulOptimized: 22041
