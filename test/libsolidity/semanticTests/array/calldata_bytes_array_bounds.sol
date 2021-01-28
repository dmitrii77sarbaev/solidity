pragma abicoder               v2;
contract C {
    function f(bytes[] calldata a, uint256 i) external returns (uint) {
        return uint8(a[0][i]);
    }
}
// ====
// compileViaYul: also
// ----
// f(bytes[],uint256): 0x40, 0, 1, 0x20, 2, 0x6162000000000000000000000000000000000000000000000000000000000000 -> 0x61
// gas Legacy: 23035
// gas LegacyOptimized: 22682
// gas Yul: 23891
// gas YulOptimized: 22680
// f(bytes[],uint256): 0x40, 1, 1, 0x20, 2, 0x6162000000000000000000000000000000000000000000000000000000000000 -> 0x62
// gas Legacy: 23047
// gas LegacyOptimized: 22694
// gas Yul: 23903
// gas YulOptimized: 22692
// f(bytes[],uint256): 0x40, 2, 1, 0x20, 2, 0x6162000000000000000000000000000000000000000000000000000000000000 -> FAILURE, hex"4e487b71", 0x32
// gas Legacy: 22830
// gas LegacyOptimized: 22599
// gas Yul: 23135
// gas YulOptimized: 22467
