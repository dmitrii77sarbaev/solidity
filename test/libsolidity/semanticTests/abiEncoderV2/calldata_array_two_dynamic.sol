pragma abicoder               v2;

contract C {
    function f(uint256[] calldata s1, uint256[] calldata s2, bool which) external pure returns (bytes memory) {
        if (which)
            return abi.encode(s1);
        else
            return abi.encode(s2);
    }
    function g(uint256[] calldata s1, uint256[] calldata s2, bool which) external view returns (bytes memory) {
        return this.f(s1, s2, which);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// f(uint256[],uint256[],bool): 0x60, 0xE0, true, 3, 23, 42, 87, 2, 51, 72 -> 32, 160, 0x20, 3, 23, 42, 87
// gas Legacy: 24659
// gas LegacyOptimized: 24172
// gas Yul: 25199
// gas YulOptimized: 24515
// f(uint256[],uint256[],bool): 0x60, 0xE0, false, 3, 23, 42, 87, 2, 51, 72 -> 32, 128, 0x20, 2, 51, 72
// gas Legacy: 24553
// gas LegacyOptimized: 24085
// gas Yul: 25103
// gas YulOptimized: 24419
// g(uint256[],uint256[],bool): 0x60, 0xE0, true, 3, 23, 42, 87, 2, 51, 72 -> 32, 160, 0x20, 3, 23, 42, 87
// gas Legacy: 29952
// gas LegacyOptimized: 28420
// gas Yul: 31197
// gas YulOptimized: 29065
// g(uint256[],uint256[],bool): 0x60, 0xE0, false, 3, 23, 42, 87, 2, 51, 72 -> 32, 128, 0x20, 2, 51, 72
// gas Legacy: 29683
// gas LegacyOptimized: 28186
// gas Yul: 30936
// gas YulOptimized: 28804
