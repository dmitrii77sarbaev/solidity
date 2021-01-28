contract C {
    function f(uint a, uint b) public pure returns (uint x) {
        x = a + b;
    }
    function g(uint8 a, uint8 b) public pure returns (uint8 x) {
        x = a + b;
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256,uint256): 5, 6 -> 11
// gas Legacy: 22291
// gas LegacyOptimized: 21729
// gas Yul: 22601
// gas YulOptimized: 21778
// f(uint256,uint256): -2, 1 -> -1
// gas Legacy: 22663
// gas LegacyOptimized: 22101
// gas Yul: 22973
// gas YulOptimized: 22150
// f(uint256,uint256): -2, 2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22465
// gas LegacyOptimized: 22029
// gas Yul: 22553
// gas YulOptimized: 21955
// f(uint256,uint256): 2, -2 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22465
// gas LegacyOptimized: 22029
// gas Yul: 22553
// gas YulOptimized: 21955
// g(uint8,uint8): 128, 64 -> 192
// gas Legacy: 22343
// gas LegacyOptimized: 21927
// gas Yul: 22650
// gas YulOptimized: 22065
// g(uint8,uint8): 128, 127 -> 255
// gas Legacy: 22343
// gas LegacyOptimized: 21927
// gas Yul: 22650
// gas YulOptimized: 22065
// g(uint8,uint8): 128, 128 -> FAILURE, hex"4e487b71", 0x11
// gas Legacy: 22139
// gas LegacyOptimized: 21836
// gas Yul: 22224
// gas YulOptimized: 21853
