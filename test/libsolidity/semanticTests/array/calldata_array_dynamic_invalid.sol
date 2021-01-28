pragma abicoder               v2;


contract C {
    function f(uint256[][] calldata a) external returns (uint256) {
        return 42;
    }

    function g(uint256[][] calldata a) external returns (uint256) {
        a[0];
        return 42;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256[][]): 0x20, 0x0 -> 42 # valid access stub #
// gas Legacy: 21980
// gas LegacyOptimized: 21808
// gas Yul: 22377
// gas YulOptimized: 21853
// f(uint256[][]): 0x20, 0x1 -> FAILURE # invalid on argument decoding #
// gas Legacy: 21720
// gas LegacyOptimized: 21664
// gas Yul: 21747
// gas YulOptimized: 21671
// f(uint256[][]): 0x20, 0x1, 0x20 -> 42 # invalid on outer access #
// gas Legacy: 22132
// gas LegacyOptimized: 21960
// gas Yul: 22529
// gas YulOptimized: 22005
// g(uint256[][]): 0x20, 0x1, 0x20 -> FAILURE
// gas Legacy: 22080
// gas LegacyOptimized: 22014
// gas Yul: 22283
// gas YulOptimized: 21958
// f(uint256[][]): 0x20, 0x1, 0x20, 0x2, 0x42 -> 42 # invalid on inner access #
// gas Legacy: 22412
// gas LegacyOptimized: 22240
// gas Yul: 22809
// gas YulOptimized: 22285
// g(uint256[][]): 0x20, 0x1, 0x20, 0x2, 0x42 -> FAILURE
// gas Legacy: 22464
// gas LegacyOptimized: 22390
// gas Yul: 22667
// gas YulOptimized: 22331
