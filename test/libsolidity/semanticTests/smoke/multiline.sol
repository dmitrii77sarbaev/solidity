contract C {
    function f(uint a, uint b, uint c, uint d, uint e) public returns (uint) {
        return a + b + c + d + e;
    }
}
// ====
// allowNonExistingFunctions: true
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256,uint256,uint256,uint256): 1, 1, 1, 1, 1
// -> 5
// gas Legacy: 23812
// gas LegacyOptimized: 22431
// gas Yul: 24142
// gas YulOptimized: 22458
// g()
// # g() does not exist #
// -> FAILURE
// gas Legacy: 21168
// gas LegacyOptimized: 21168
// gas Yul: 21202
// gas YulOptimized: 21156
