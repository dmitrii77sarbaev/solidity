pragma abicoder               v2;
contract C {
    function f(uint256[] calldata x, uint256 i) external returns (uint256) {
        return x[i];
    }
    function f(uint256[][] calldata x, uint256 i, uint256 j) external returns (uint256) {
        return x[i][j];
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256[],uint256): 0x40, 0, 0 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22125
// gas LegacyOptimized: 21963
// gas Yul: 22262
// gas YulOptimized: 21923
// f(uint256[],uint256): 0x40, 0, 1, 23 -> 23
// gas Legacy: 22478
// gas LegacyOptimized: 22209
// gas Yul: 22998
// gas YulOptimized: 22290
// f(uint256[],uint256): 0x40, 1, 1, 23 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22289
// gas LegacyOptimized: 22127
// gas Yul: 22426
// gas YulOptimized: 22087
// f(uint256[],uint256): 0x40, 0, 2, 23, 42 -> 23
// gas Legacy: 22618
// gas LegacyOptimized: 22349
// gas Yul: 23138
// gas YulOptimized: 22430
// f(uint256[],uint256): 0x40, 1, 2, 23, 42 -> 42
// gas Legacy: 22630
// gas LegacyOptimized: 22361
// gas Yul: 23150
// gas YulOptimized: 22442
// f(uint256[],uint256): 0x40, 2, 2, 23, 42 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22429
// gas LegacyOptimized: 22267
// gas Yul: 22566
// gas YulOptimized: 22227
// f(uint256[][],uint256,uint256): 0x60, 0, 0 -> FAILURE
// gas Legacy: 21773
// gas LegacyOptimized: 21746
// gas Yul: 21800
// gas YulOptimized: 21753
// f(uint256[][],uint256,uint256): 0x60, 0, 0, 1, 0x20, 1, 23 -> 23
// gas Legacy: 23333
// gas LegacyOptimized: 22888
// gas Yul: 23939
// gas YulOptimized: 23089
