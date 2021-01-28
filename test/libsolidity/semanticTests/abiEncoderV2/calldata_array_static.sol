pragma abicoder               v2;

contract C {
    function f(uint256[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[3] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function h(uint8[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[3] calldata s) external view returns (bytes memory) {
        return this.h(s);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
// gas Legacy: 22749
// gas LegacyOptimized: 22376
// gas Yul: 23233
// gas YulOptimized: 22558
// g(uint256[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
// gas Legacy: 26673
// gas LegacyOptimized: 25547
// gas Yul: 27803
// gas YulOptimized: 25973
// h(uint8[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
// gas Legacy: 24326
// gas LegacyOptimized: 22791
// gas Yul: 24842
// gas YulOptimized: 23122
// i(uint8[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
// gas Legacy: 29739
// gas LegacyOptimized: 26289
// gas Yul: 30933
// gas YulOptimized: 26999
// h(uint8[3]): 0xFF23, 0x1242, 0xAB87 -> FAILURE
// gas Legacy: 22302
// gas LegacyOptimized: 21957
// gas Yul: 22416
// gas YulOptimized: 21947
// i(uint8[3]): 0xAB23, 0x1242, 0xFF87 -> FAILURE
// gas Legacy: 22318
// gas LegacyOptimized: 21970
// gas Yul: 23343
// gas YulOptimized: 22674
