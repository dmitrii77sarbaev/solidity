contract test {
    function f(bool cond, uint v) public returns (uint a, uint b) {
        cond ? a = v : b = v;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(bool,uint256): true, 20 -> 20, 0
// gas Legacy: 22232
// gas LegacyOptimized: 21744
// gas Yul: 22580
// gas YulOptimized: 21828
// f(bool,uint256): false, 20 -> 0, 20
// gas Legacy: 22230
// gas LegacyOptimized: 21739
// gas Yul: 22558
// gas YulOptimized: 21806
