pragma abicoder               v2;

contract C {
    function f(uint256[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function g(uint256[][2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.f(s[which]);
    }
    function h(uint8[] calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function i(uint8[][2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.h(s[which]);
    }
    function j(bytes calldata s) external pure returns (bytes memory) {
        return abi.encode(s);
    }
    function k(bytes[2] calldata s, uint256 which) external view returns (bytes memory) {
        return this.j(s[which]);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[]): 32, 3, 42, 23, 87 -> 32, 160, 32, 3, 42, 23, 87
// gas Legacy: 23508
// gas LegacyOptimized: 23074
// gas Yul: 24021
// gas YulOptimized: 23367
// g(uint256[][2],uint256): 0x40, 0, 0x40, 0xC0, 3, 42, 23, 87, 4, 11, 13, 17 -> 32, 160, 32, 3, 42, 23, 87
// gas Legacy: 29321
// gas LegacyOptimized: 27873
// gas Yul: 30591
// gas YulOptimized: 28572
// g(uint256[][2],uint256): 0x40, 1, 0x40, 0xC0, 3, 42, 23, 87, 4, 11, 13, 17, 27 -> 32, 192, 32, 4, 11, 13, 17, 27
// gas Legacy: 29722
// gas LegacyOptimized: 28250
// gas Yul: 30995
// gas YulOptimized: 28976
// h(uint8[]): 32, 3, 42, 23, 87 -> 32, 160, 32, 3, 42, 23, 87
// gas Legacy: 24977
// gas LegacyOptimized: 23456
// gas Yul: 25508
// gas YulOptimized: 23828
// i(uint8[][2],uint256): 0x40, 0, 0x40, 0xC0, 3, 42, 23, 87, 4, 11, 13, 17 -> 32, 160, 32, 3, 42, 23, 87
// gas Legacy: 32193
// gas LegacyOptimized: 28571
// gas Yul: 33499
// gas YulOptimized: 29428
// i(uint8[][2],uint256): 0x40, 1, 0x40, 0xC0, 3, 42, 23, 87, 4, 11, 13, 17, 27 -> 32, 192, 32, 4, 11, 13, 17, 27
// gas Legacy: 33534
// gas LegacyOptimized: 29168
// gas Yul: 34863
// gas YulOptimized: 30100
// j(bytes): 32, 3, hex"AB11FF" -> 32, 96, 32, 3, left(0xAB11FF)
// gas Legacy: 23050
// gas LegacyOptimized: 22548
// gas Yul: 23550
// gas YulOptimized: 22851
// k(bytes[2],uint256): 0x40, 0, 0x40, 0x63, 3, hex"AB11FF", 4, hex"FF791432" -> 32, 96, 32, 3, left(0xAB11FF)
// gas Legacy: 28148
// gas LegacyOptimized: 26619
// gas Yul: 29390
// gas YulOptimized: 27211
// k(bytes[2],uint256): 0x40, 1, 0x40, 0x63, 3, hex"AB11FF", 4, hex"FF791432" -> 32, 96, 32, 4, left(0xFF791432)
// gas Legacy: 28160
// gas LegacyOptimized: 26631
// gas Yul: 29402
// gas YulOptimized: 27223
