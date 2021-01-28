contract C {
    function f(uint a) public pure returns (uint x) {
        uint b = a;
        x = b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 6 -> 6
// gas Legacy: 21797
// gas LegacyOptimized: 21484
// gas Yul: 22083
// gas YulOptimized: 21369
