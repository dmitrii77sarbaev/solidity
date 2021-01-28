pragma abicoder v2;

contract Test {
    struct shouldBug {
        uint256[][2] deadly;
    }
    function killer(uint256[][2] calldata weapon) pure external returns (shouldBug memory) {
        return shouldBug(weapon);
    }
}
// ====
// compileViaYul: also
// ----
// killer(uint256[][2]): 0x20, 0x40, 0x40, 2, 1, 2 -> 0x20, 0x20, 0x40, 0xa0, 2, 1, 2, 2, 1, 2
// gas Legacy: 27813
// gas LegacyOptimized: 24649
// gas Yul: 29336
// gas YulOptimized: 25487
