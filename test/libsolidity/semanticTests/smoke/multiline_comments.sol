contract C {
    function f(uint a, uint b, uint c, uint d, uint e) public returns (uint) {
        return a + b + c + d + e;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256,uint256,uint256,uint256,uint256): 1, 1, 1, 1, 1
// # A comment on the function parameters. #
// -> 5
// gas Legacy: 23812
// gas LegacyOptimized: 22431
// gas Yul: 24142
// gas YulOptimized: 22458
// f(uint256,uint256,uint256,uint256,uint256):
// 1,
// 1,
// 1,
// 1,
// 1
// -> 5
// # Should return sum of all parameters. #
// gas Legacy: 23812
// gas LegacyOptimized: 22431
// gas Yul: 24142
// gas YulOptimized: 22458
