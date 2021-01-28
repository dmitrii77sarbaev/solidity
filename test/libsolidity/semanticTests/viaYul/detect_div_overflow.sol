contract C {
    function f(uint a, uint b) public pure returns (uint x) {
        x = a / b;
    }
    function g(int8 a, int8 b) public pure returns (int8 x) {
        x = a / b;
    }
    function h(uint256 a, uint256 b) public pure returns (uint256 x) {
        x = a / b;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256,uint256): 10, 3 -> 3
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21850
// f(uint256,uint256): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22066
// gas LegacyOptimized: 21633
// gas Yul: 22157
// gas YulOptimized: 21634
// f(uint256,uint256): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22054
// gas LegacyOptimized: 21621
// gas Yul: 22145
// gas YulOptimized: 21622
// f(uint256,uint256): 0, 1 -> 0
// gas Legacy: 22266
// gas LegacyOptimized: 21707
// gas Yul: 22579
// gas YulOptimized: 21838
// g(int8,int8): -10, 3 -> -3
// gas Legacy: 22756
// gas LegacyOptimized: 22349
// gas Yul: 23072
// gas YulOptimized: 22484
// g(int8,int8): -10, -3 -> 3
// gas Legacy: 23128
// gas LegacyOptimized: 22721
// gas Yul: 23444
// gas YulOptimized: 22856
// g(int8,int8): -10, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22492
// gas LegacyOptimized: 22195
// gas Yul: 22583
// gas YulOptimized: 22212
// g(int8,int8): -128, 1 -> -128
// gas Legacy: 22756
// gas LegacyOptimized: 22349
// gas Yul: 23072
// gas YulOptimized: 22484
// g(int8,int8): -128, -2 -> 64
// gas Legacy: 23128
// gas LegacyOptimized: 22721
// gas Yul: 23444
// gas YulOptimized: 22856
// g(int8,int8): -128, 2 -> -64
// gas Legacy: 22756
// gas LegacyOptimized: 22349
// gas Yul: 23072
// gas YulOptimized: 22484
// g(int8,int8): -128, -1 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22920
// gas LegacyOptimized: 22608
// gas Yul: 23014
// gas YulOptimized: 22625
// g(int8,int8): -127, -1 -> 127
// gas Legacy: 23128
// gas LegacyOptimized: 22721
// gas Yul: 23444
// gas YulOptimized: 22856
// h(uint256,uint256): 0x8000000000000000000000000000000000000000000000000000000000000000, -1 -> 0
// gas Legacy: 22694
// gas LegacyOptimized: 22135
// gas Yul: 23007
// gas YulOptimized: 22266
