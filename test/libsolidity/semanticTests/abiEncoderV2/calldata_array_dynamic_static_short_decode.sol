pragma abicoder               v2;
contract C {
    function f(uint256[][2][] calldata x) external returns (uint256) {
        x[0]; // trigger bounds checks
        return 23;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256[][2][]): 0x20, 0x01, 0x20, 0x40, 0x60, 0x00, 0x00 -> 23 # this is the common encoding for x.length == 1 && x[0][0].length == 0 && x[0][1].length == 0 #
// gas Legacy: 22829
// gas LegacyOptimized: 22655
// gas Yul: 23371
// gas YulOptimized: 22648
// f(uint256[][2][]): 0x20, 0x01, 0x20, 0x00, 0x00 -> 23 # exotic, but still valid encoding #
// gas Legacy: 22549
// gas LegacyOptimized: 22375
// gas Yul: 23091
// gas YulOptimized: 22368
// f(uint256[][2][]): 0x20, 0x01, 0x20, 0x00 -> FAILURE # invalid (too short) encoding, but no failure due to this PR #
// gas Legacy: 22183
// gas LegacyOptimized: 22117
// gas Yul: 22382
// gas YulOptimized: 22003
