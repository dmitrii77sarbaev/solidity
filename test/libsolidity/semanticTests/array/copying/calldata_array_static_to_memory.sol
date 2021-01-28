contract C {
    function f(uint256[2] calldata c) public returns (uint256, uint256) {
        uint256[2] memory m1 = c;
        return (m1[0], m1[1]);
    }
}
// ====
// compileViaYul: also
// ----
// f(uint256[2]): 43, 57 -> 43, 57
// gas Legacy: 22217
// gas LegacyOptimized: 21868
// gas Yul: 23909
// gas YulOptimized: 22301
