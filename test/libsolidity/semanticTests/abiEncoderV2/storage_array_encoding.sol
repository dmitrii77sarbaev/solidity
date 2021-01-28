pragma abicoder               v2;

// tests encoding from storage arrays

contract C {
    uint256[2][] tmp_h;
    function h(uint256[2][] calldata s) external returns (bytes memory) {
        tmp_h = s;
        return abi.encode(tmp_h);
    }
    uint256[2][2] tmp_i;
    function i(uint256[2][2] calldata s) external returns (bytes memory) {
        tmp_i = s;
        return abi.encode(tmp_i);
    }
}
// ====
// EVMVersion: >homestead
// compileViaYul: also
// ----
// h(uint256[2][]): 0x20, 3, 123, 124, 223, 224, 323, 324 -> 32, 256, 0x20, 3, 123, 124, 223, 224, 323, 324
// gas Legacy: 175929
// gas LegacyOptimized: 172506
// gas Yul: 185613
// gas YulOptimized: 172714
// i(uint256[2][2]): 123, 124, 223, 224 -> 32, 128, 123, 124, 223, 224
// gas Legacy: 109868
// gas LegacyOptimized: 107388
// gas Yul: 116522
// gas YulOptimized: 107681
