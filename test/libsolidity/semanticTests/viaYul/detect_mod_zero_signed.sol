contract C {
    function f(int a, int b) public pure returns (int x) {
        x = a % b;
    }
    function g(int8 a, int8 b) public pure returns (int8 x) {
        x = a % b;
    }
}
// ====
// compileViaYul: also
// ----
// f(int256,int256): 10, 3 -> 1
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(int256,int256): 10, 2 -> 0
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(int256,int256): 11, 2 -> 1
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(int256,int256): -10, 3 -> -1
// gas Legacy: 22650
// gas LegacyOptimized: 22091
// gas Yul: 22963
// gas YulOptimized: 22146
// f(int256,int256): 10, -3 -> 1
// gas Legacy: 22650
// gas LegacyOptimized: 22091
// gas Yul: 22963
// gas YulOptimized: 22146
// f(int256,int256): -10, -3 -> -1
// gas Legacy: 23022
// gas LegacyOptimized: 22463
// gas Yul: 23335
// gas YulOptimized: 22518
// f(int256,int256): 2, 2 -> 0
// gas Legacy: 22278
// gas LegacyOptimized: 21719
// gas Yul: 22591
// gas YulOptimized: 21774
// f(int256,int256): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22066
// gas LegacyOptimized: 21633
// gas Yul: 22157
// gas YulOptimized: 21565
// f(int256,int256): -1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22438
// gas LegacyOptimized: 22005
// gas Yul: 22529
// gas YulOptimized: 21937
// f(int256,int256): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22054
// gas LegacyOptimized: 21621
// gas Yul: 22145
// gas YulOptimized: 21553
// f(int256,int256): 0, 1 -> 0
// gas Legacy: 22266
// gas LegacyOptimized: 21707
// gas Yul: 22579
// gas YulOptimized: 21762
// f(int256,int256): 0, -1 -> 0
// gas Legacy: 22638
// gas LegacyOptimized: 22079
// gas Yul: 22951
// gas YulOptimized: 22134
// g(int8,int8): 10, 3 -> 1
// gas Legacy: 22340
// gas LegacyOptimized: 21926
// gas Yul: 22653
// gas YulOptimized: 22063
// g(int8,int8): 10, 2 -> 0
// gas Legacy: 22340
// gas LegacyOptimized: 21926
// gas Yul: 22653
// gas YulOptimized: 22063
// g(int8,int8): 11, 2 -> 1
// gas Legacy: 22340
// gas LegacyOptimized: 21926
// gas Yul: 22653
// gas YulOptimized: 22063
// g(int8,int8): -10, 3 -> -1
// gas Legacy: 22712
// gas LegacyOptimized: 22298
// gas Yul: 23025
// gas YulOptimized: 22435
// g(int8,int8): 10, -3 -> 1
// gas Legacy: 22712
// gas LegacyOptimized: 22298
// gas Yul: 23025
// gas YulOptimized: 22435
// g(int8,int8): -10, -3 -> -1
// gas Legacy: 23084
// gas LegacyOptimized: 22670
// gas Yul: 23397
// gas YulOptimized: 22807
// g(int8,int8): 2, 2 -> 0
// gas Legacy: 22340
// gas LegacyOptimized: 21926
// gas Yul: 22653
// gas YulOptimized: 22063
// g(int8,int8): 1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22120
// gas LegacyOptimized: 21812
// gas Yul: 22211
// gas YulOptimized: 21829
// g(int8,int8): -1, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22492
// gas LegacyOptimized: 22184
// gas Yul: 22583
// gas YulOptimized: 22201
// g(int8,int8): 0, 0 -> FAILURE, hex"4e487b71", 0x12
// gas Legacy: 22108
// gas LegacyOptimized: 21800
// gas Yul: 22199
// gas YulOptimized: 21817
// g(int8,int8): 0, 1 -> 0
// gas Legacy: 22328
// gas LegacyOptimized: 21914
// gas Yul: 22641
// gas YulOptimized: 22051
// g(int8,int8): 0, -1 -> 0
// gas Legacy: 22700
// gas LegacyOptimized: 22286
// gas Yul: 23013
// gas YulOptimized: 22423
// g(int8,int8): -128, -128 -> 0
// gas Legacy: 23084
// gas LegacyOptimized: 22670
// gas Yul: 23397
// gas YulOptimized: 22807
// g(int8,int8): -128, 127 -> -1
// gas Legacy: 22712
// gas LegacyOptimized: 22298
// gas Yul: 23025
// gas YulOptimized: 22435
