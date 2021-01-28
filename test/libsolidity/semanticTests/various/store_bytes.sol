// this test just checks that the copy loop does not mess up the stack
contract C {
    function save() public returns (uint256 r) {
        r = 23;
        savedData = msg.data;
        r = 24;
    }

    bytes savedData;
}
// ====
// compileViaYul: also
// ----
// save() -> 24 # empty copy loop #
// gas Legacy: 42605
// gas LegacyOptimized: 42470
// gas Yul: 43402
// gas YulOptimized: 42564
// save(): "abcdefg" -> 24
// gas Legacy: 44590
// gas LegacyOptimized: 44454
// gas Yul: 45406
// gas YulOptimized: 44610
