contract test {
    function f(uint x) public pure returns (uint, int) {
        unchecked {
            uint a = 2 ** x;
            int b = -2 ** x;
            return (a, b);
        }
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256): 0 -> 1, 1
// gas Legacy: 21935
// gas LegacyOptimized: 21536
// gas Yul: 22837
// gas YulOptimized: 21396
// f(uint256): 1 -> 2, -2
// gas Legacy: 22047
// gas LegacyOptimized: 21648
// gas Yul: 22949
// gas YulOptimized: 21458
// f(uint256): 2 -> 4, 4
// gas Legacy: 22047
// gas LegacyOptimized: 21648
// gas Yul: 22949
// gas YulOptimized: 21458
// f(uint256): 13 -> 0x2000, -8192
// gas Legacy: 22047
// gas LegacyOptimized: 21648
// gas Yul: 22949
// gas YulOptimized: 21458
// f(uint256): 113 -> 0x020000000000000000000000000000, -10384593717069655257060992658440192
// gas Legacy: 22047
// gas LegacyOptimized: 21648
// gas Yul: 22949
// gas YulOptimized: 21458
// f(uint256): 114 -> 0x040000000000000000000000000000, 20769187434139310514121985316880384
// gas Legacy: 22047
// gas LegacyOptimized: 21648
// gas Yul: 22949
// gas YulOptimized: 21458
// f(uint256): 1113 -> 0x00, 0
// gas Legacy: 22159
// gas LegacyOptimized: 21760
// gas Yul: 23061
// gas YulOptimized: 21520
// f(uint256): 1114 -> 0x00, 0
// gas Legacy: 22159
// gas LegacyOptimized: 21760
// gas Yul: 23061
// gas YulOptimized: 21520
