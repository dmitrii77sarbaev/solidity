pragma abicoder               v2;

contract C {
    function f(uint8[1][][1] calldata s) external pure returns (bytes memory) {
        return msg.data;
    }
    function f2(uint256[2][][2] calldata s) external pure returns (bytes memory) {
        return msg.data;
    }
    function reenc_f(uint8[1][][1] calldata s) external view returns (bytes memory) {
        return this.f(s);
    }
    function reenc_f2(uint256[2][][2] calldata s) external view returns (bytes memory) {
        return this.f2(s);
    }
    function g() external returns (bytes memory) {
        uint8[1][][1] memory m = [new uint8[1][](1)];
        m[0][0][0] = 42;
        return this.f(m);
    }
    function h() external returns (bytes memory) {
        uint8[1][][1] memory m = [new uint8[1][](1)];
        m[0][0][0] = 42;
        return this.reenc_f(m);
    }
    function i() external returns (bytes memory) {
        uint256[2][][2] memory m = [new uint256[2][](1),new uint256[2][](1)];
        m[0][0][0] = 0x00042;
        m[0][0][1] = 0x00142;
        m[1][0][0] = 0x10042;
        m[1][0][1] = 0x10142;
        return this.f2(m);
    }
    function j() external returns (bytes memory) {
        uint256[2][][2] memory m = [new uint256[2][](1),new uint256[2][](1)];
        m[0][0][0] = 0x00042;
        m[0][0][1] = 0x00142;
        m[1][0][0] = 0x10042;
        m[1][0][1] = 0x10142;
        return this.reenc_f2(m);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// g() -> 32, 132, hex"15cfcc01", 32, 32, 1, 42, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 28389
// gas LegacyOptimized: 26336
// gas Yul: 27972
// gas YulOptimized: 27942
// h() -> 32, 132, hex"15cfcc01", 32, 32, 1, 42, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 34487
// gas LegacyOptimized: 30502
// gas Yul: 32589
// gas YulOptimized: 32559
// i() -> 32, 292, hex"dc0ee233", 32, 64, 160, 1, 0x42, 0x000142, 1, 0x010042, 0x010142, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 32015
// gas LegacyOptimized: 28551
// gas Yul: 31632
// gas YulOptimized: 31602
// j() -> 32, 292, hex"dc0ee233", 32, 64, 160, 1, 0x42, 0x000142, 1, 0x010042, 0x010142, hex"00000000000000000000000000000000000000000000000000000000"
// gas Legacy: 39189
// gas LegacyOptimized: 33675
// gas Yul: 37232
// gas YulOptimized: 37202
