pragma abicoder               v2;
contract C {
    function f(bytes[] calldata a, uint256 i) external returns (uint) {
        return uint8(a[0][i]);
    }
}
// ====
// compileViaYul: also
// ----
// f(bytes[],uint256): 0x40, 0, 1, 0x20, 2, hex"6162" -> 0x61
// gas Legacy: 22915
// gas LegacyOptimized: 22562
// gas Yul: 23771
// gas YulOptimized: 22560
// f(bytes[],uint256): 0x40, 1, 1, 0x20, 2, hex"6162" -> 0x62
// gas Legacy: 22927
// gas LegacyOptimized: 22574
// gas Yul: 23783
// gas YulOptimized: 22572
// f(bytes[],uint256): 0x40, 2, 1, 0x20, 2, hex"6162" -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22710
// gas LegacyOptimized: 22479
// gas Yul: 23015
// gas YulOptimized: 22347
