pragma abicoder               v2;

contract C {
    function f(uint256[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function h(uint8[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[] calldata s) external view returns (bytes memory) {
        return this.h(s);
    }
    function j(bytes calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function k(bytes calldata s) external view returns (bytes memory) {
        return this.j(s);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
// gas Legacy: 23508
// gas LegacyOptimized: 23074
// gas Yul: 24021
// gas YulOptimized: 23367
// g(uint256[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
// gas Legacy: 28074
// gas LegacyOptimized: 26810
// gas Yul: 29264
// gas YulOptimized: 27462
// h(uint8[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
// gas Legacy: 24977
// gas LegacyOptimized: 23456
// gas Yul: 25508
// gas YulOptimized: 23828
// i(uint8[]): 32, 3, 23, 42, 87 -> 32, 160, 32, 3, 23, 42, 87
// gas Legacy: 30880
// gas LegacyOptimized: 27442
// gas Yul: 32106
// gas YulOptimized: 28252
// h(uint8[]): 32, 3, 0xFF23, 0x1242, 0xAB87 -> FAILURE
// gas Legacy: 22780
// gas LegacyOptimized: 22502
// gas Yul: 22907
// gas YulOptimized: 22497
// i(uint8[]): 32, 3, 0xAB23, 0x1242, 0xFF87 -> FAILURE
// gas Legacy: 22746
// gas LegacyOptimized: 22465
// gas Yul: 23784
// gas YulOptimized: 23174
// j(bytes): 32, 3, hex"123456" -> 32, 96, 32, 3, left(0x123456)
// gas Legacy: 23028
// gas LegacyOptimized: 22526
// gas Yul: 23528
// gas YulOptimized: 22829
// k(bytes): 32, 3, hex"AB33FF" -> 32, 96, 32, 3, left(0xAB33FF)
// gas Legacy: 27191
// gas LegacyOptimized: 25807
// gas Yul: 28353
// gas YulOptimized: 26461
