contract C {
    function f(uint256 x) public returns (uint256) {
        return eval(g, x);
    }

    function eval(function(uint) internal returns (uint) x, uint a) internal returns (uint) {
        return x(a);
    }

    function g(uint256 x) public pure returns (uint256) {
        return x + 1;
    }
}
// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(uint256): 7 -> 8
// gas Legacy: 22075
// gas LegacyOptimized: 21655
// gas Yul: 22669
// gas YulOptimized: 21635
