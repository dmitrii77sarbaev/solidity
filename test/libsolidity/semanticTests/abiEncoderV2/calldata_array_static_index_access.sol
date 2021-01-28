pragma abicoder               v2;

contract C {
    function f(uint256[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[3][2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.f(s[which]);
    }
    function h(uint8[3] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[3][2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.h(s[which]);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
// gas Legacy: 22793
// gas LegacyOptimized: 22424
// gas Yul: 23277
// gas YulOptimized: 22602
// g(uint256[3][2],uint256): 23, 42, 87, 123, 142, 187, 0 -> 32, 96, 23, 42, 87
// gas Legacy: 27431
// gas LegacyOptimized: 26160
// gas Yul: 28631
// gas YulOptimized: 26658
// g(uint256[3][2],uint256): 23, 42, 87, 123, 142, 187, 1 -> 32, 96, 123, 142, 187
// gas Legacy: 27443
// gas LegacyOptimized: 26172
// gas Yul: 28643
// gas YulOptimized: 26670
// h(uint8[3]): 23, 42, 87 -> 32, 96, 23, 42, 87
// gas Legacy: 24348
// gas LegacyOptimized: 22817
// gas Yul: 24864
// gas YulOptimized: 23144
// i(uint8[3][2],uint256): 23, 42, 87, 123, 142, 187, 0 -> 32, 96, 23, 42, 87
// gas Legacy: 30497
// gas LegacyOptimized: 26902
// gas Yul: 31761
// gas YulOptimized: 27684
// i(uint8[3][2],uint256): 23, 42, 87, 123, 142, 187, 1 -> 32, 96, 123, 142, 187
// gas Legacy: 30509
// gas LegacyOptimized: 26914
// gas Yul: 31773
// gas YulOptimized: 27696
