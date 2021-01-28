contract C {
    function f(uint a, uint b) public pure returns (uint x, uint y) {
        x = a;
        y = b;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256): 5, 6 -> 5, 6
// gas Legacy: 22211
// gas LegacyOptimized: 21668
// gas Yul: 22530
// gas YulOptimized: 21524
