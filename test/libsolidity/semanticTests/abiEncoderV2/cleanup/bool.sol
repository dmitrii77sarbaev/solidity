pragma abicoder               v2;

contract C {
    function gggg(bool x) external pure returns (bool) {
        return x;
    }
    function f(uint256 a) external view returns (bool) {
        bool x = false;
        assembly { x := a }
        return this.gggg(x);
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256): 0 -> false
// gas Legacy: 24398
// gas LegacyOptimized: 23646
// gas Yul: 25334
// gas YulOptimized: 23910
// gggg(bool): 0 -> false # test validation as well as sanity check #
// gas Legacy: 21806
// gas LegacyOptimized: 21563
// gas Yul: 22106
// gas YulOptimized: 21718
// f(uint256): 1 -> true
// gas Legacy: 24410
// gas LegacyOptimized: 23658
// gas Yul: 25346
// gas YulOptimized: 23922
// gggg(bool): 1 -> true
// gas Legacy: 21818
// gas LegacyOptimized: 21575
// gas Yul: 22118
// gas YulOptimized: 21730
// f(uint256): 2 -> true
// gas Legacy: 24410
// gas LegacyOptimized: 23658
// gas Yul: 25346
// gas YulOptimized: 23922
// gggg(bool): 2 -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21440
// gas Yul: 21570
// gas YulOptimized: 21447
// f(uint256): 0x1000 -> true
// gas Legacy: 24410
// gas LegacyOptimized: 23658
// gas Yul: 25346
// gas YulOptimized: 23922
// gggg(bool): 0x1000 -> FAILURE
// gas Legacy: 21542
// gas LegacyOptimized: 21440
// gas Yul: 21570
// gas YulOptimized: 21447
