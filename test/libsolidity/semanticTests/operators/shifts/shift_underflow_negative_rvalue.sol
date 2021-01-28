contract C {
    function f(int256 a, uint256 b) public returns (int256) {
        return a << b;
    }

    function g(int256 a, uint256 b) public returns (int256) {
        return a >> b;
    }
}

// ====
// compileToEwasm: also
// compileViaYul: also
// ----
// f(int256,uint256): 1, -1 -> 0
// gas Legacy: 22500
// gas LegacyOptimized: 22044
// gas Yul: 23001
// gas YulOptimized: 22099
// g(int256,uint256): 1, -1 -> 0
// gas Legacy: 22478
// gas LegacyOptimized: 22022
// gas Yul: 23023
// gas YulOptimized: 22008
