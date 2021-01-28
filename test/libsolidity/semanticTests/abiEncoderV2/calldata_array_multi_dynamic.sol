pragma abicoder               v2;

contract C {
    function f(uint256[][] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[][] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function h(uint8[][] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[][] calldata s) external view returns (bytes memory) {
        return this.h(s);
    }
    function j(bytes[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function k(bytes[] calldata s) external view returns (bytes memory) {
        return this.j(s);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[][]): 0x20, 2, 0x40, 0xC0, 3, 13, 17, 23, 4, 27, 31, 37, 41 -> 32, 416, 32, 2, 64, 192, 3, 13, 17, 23, 4, 27, 31, 37, 41
// gas Legacy: 26619
// gas LegacyOptimized: 25593
// gas Yul: 27178
// gas YulOptimized: 26059
// g(uint256[][]): 0x20, 2, 0x40, 0xC0, 3, 13, 17, 23, 4, 27, 31, 37, 41 -> 32, 416, 32, 2, 64, 192, 3, 13, 17, 23, 4, 27, 31, 37, 41
// gas Legacy: 33803
// gas LegacyOptimized: 31291
// gas Yul: 35093
// gas YulOptimized: 32361
// h(uint8[][]): 0x20, 2, 0x40, 0xC0, 3, 13, 17, 23, 4, 27, 31, 37, 41 -> 32, 416, 32, 2, 64, 192, 3, 13, 17, 23, 4, 27, 31, 37, 41
// gas Legacy: 29829
// gas LegacyOptimized: 26249
// gas Yul: 30434
// gas YulOptimized: 26891
// i(uint8[][]): 0x20, 2, 0x40, 0xC0, 3, 13, 17, 23, 4, 27, 31, 37, 41 -> 32, 416, 32, 2, 64, 192, 3, 13, 17, 23, 4, 27, 31, 37, 41
// gas Legacy: 40135
// gas LegacyOptimized: 32515
// gas Yul: 41517
// gas YulOptimized: 33937
// j(bytes[]): 0x20, 2, 0x40, 0x63, 3, hex"131723", 4, hex"27313741" -> 32, 256, 32, 2, 64, 128, 3, left(0x131723), 4, left(0x27313741)
// gas Legacy: 25318
// gas LegacyOptimized: 24242
// gas Yul: 25850
// gas YulOptimized: 24613
// k(bytes[]): 0x20, 2, 0x40, 0x63, 3, hex"131723", 4, hex"27313741" -> 32, 256, 32, 2, 64, 128, 3, left(0x131723), 4, left(0x27313741)
// gas Legacy: 31685
// gas LegacyOptimized: 29113
// gas Yul: 32916
// gas YulOptimized: 29948
