contract C {
    function leftU(uint8 x, uint8 y) public returns (uint8) {
        return x << y;
    }

    function leftS(int8 x, uint8 y) public returns (int8) {
        return x << y;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// leftU(uint8,uint8): 255, 8 -> 0
// gas Legacy: 22158
// gas LegacyOptimized: 21838
// gas Yul: 22659
// gas YulOptimized: 21964
// leftU(uint8,uint8): 255, 1 -> 254
// gas Legacy: 22158
// gas LegacyOptimized: 21838
// gas Yul: 22659
// gas YulOptimized: 21964
// leftU(uint8,uint8): 255, 0 -> 255
// gas Legacy: 22146
// gas LegacyOptimized: 21826
// gas Yul: 22647
// gas YulOptimized: 21952
// leftS(int8,uint8): 1, 7 -> -128 # Result is -128 and output is sign-extended, not zero-padded. #
// gas Legacy: 22142
// gas LegacyOptimized: 21797
// gas Yul: 22643
// gas YulOptimized: 21895
// leftS(int8,uint8): 1, 6 -> 64
// gas Legacy: 22142
// gas LegacyOptimized: 21797
// gas Yul: 22643
// gas YulOptimized: 21895
